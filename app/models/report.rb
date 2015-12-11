class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  belongs_to :accounting_standard
  
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values
  
  has_many :users, through: :versions

  has_many :approvals, through: :versions
  
  has_one :industry, through: :company
  has_many :indicators, through: :industry
  has_many :formulas, through: :indicators
  
  def company_title
    company.title
  end
  
  def industry_title
    industry.title
  end
  
  def period_title
    period.title
  end
  
  def accounting_standard_title
    accounting_standard.title
  end
  
  # The most rated author of this report
  def author_id
    users.order("rating DESC").first.id
  end
  
  # Rating of the most rated maker of this report
  def maker_rating
    users.order("rating DESC").first.rating
  end
  
  # Best (most rated) version
  def best_version
    versions.order(:rating, :updated_at).last
  end
  
  # Report version id
  def version_id
    versions.where(user_id: self.author_id).pluck(:id).pop
  end
  
  # Value of indicator
  def indicator_value(indicator)
    values.where(indicator_id: indicator.id).pluck(:value).pop
  end
  
  # Currency of the value
  def original_currency(indicator)
    values.where(indicator_id: indicator.id).pluck(:currency_id).pop
  end
  
  # User's name
  def author_name
    users.last.name
  end
  
  # Checker's name
  def checker_name
    best_version.checker
  end
  
  # Maker's reward
  # def maker_reward
  #   best_version.maker_reward
  # end
  
  # Rate of report completeness
  def completeness
    val = values.pluck(:value)
    not_nil = val.count { |c| not c.nil? }
    total = val.count
    not_nil.to_f / total
  end
  
  # Checker's id
  # def checker_id
  #   versions.order(:rating).last.checker
  # end
end
