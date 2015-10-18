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
  
  # The most rated author of this report
  def author_id
    users.order("rating DESC").first.id
  end
  
  # Report version id
  def version_id
    versions.where(user_id: self.author_id).pluck(:id).pop
  end
  
  # Value of indicator
  def indicator_value(indicator)
    values.where(indicator_id: indicator.id, version_id: self.version_id).pluck(:value).pop
  end
  
  # User's email
  def author_email
    users.last.email
  end
  
  # Checker's id
  def checker_id
    approvals.last.user.id
  end
  
  # Checker's email
  def checker_email
    approvals.last.user.email
  end
end
