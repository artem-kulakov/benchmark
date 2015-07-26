class Industry < ActiveRecord::Base
  has_many :companies

  has_many :industry_indicators
  has_many :indicators, through: :industry_indicators
end
