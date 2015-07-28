class Indicator < ActiveRecord::Base
  has_many :industry_indicators
  has_many :industries, through: :industry_indicators
  
  has_many :values
end
