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
end
