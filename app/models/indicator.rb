class Indicator < ActiveRecord::Base
  belongs_to :industry
  has_many :values
  
  has_one :formula
  accepts_nested_attributes_for :formula
end
