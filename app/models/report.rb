class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  
  has_many :values
  
  has_one :industry, through: :company
  has_many :indicators, through: :industry
  
  @industry = Industry.find(1)
end
