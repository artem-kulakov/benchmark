class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values
  has_many :users, through: :values
  
  has_one :industry, through: :company
  has_many :indicators, through: :industry
  has_many :formulas, through: :indicators
end
