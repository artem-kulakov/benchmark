class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  
  has_many :versions
  accepts_nested_attributes_for :versions
  
  has_many :users, through: :versions

  has_many :values, through: :versions
  
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
    versions.order(:rating).last
  end
  
  # Report version id
  def version_id
    versions.where(user_id: self.author_id).pluck(:id).pop
  end
  
  # Value of indicator
  def indicator_value(indicator)
    values.where(indicator_id: indicator.id, version_id: self.version_id).pluck(:value).pop
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
  def maker_reward
    best_version.maker_reward
  end
  
  # Rate of report completeness
  def completeness
    foo = values.where(version_id: self.version_id).pluck(:value)
    not_nil = foo.count { |c| not c.nil? }
    total = foo.count
    not_nil.to_f / total
  end
  
  # Checker's id
  def checker_id
    versions.order(:rating).last.checker
  end
end
