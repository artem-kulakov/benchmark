class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  
  has_many :values
  accepts_nested_attributes_for :values
  
  has_one :industry, through: :company
  has_many :indicators, through: :industry
end
