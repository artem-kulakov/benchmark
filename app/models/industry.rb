class Industry < ActiveRecord::Base
  has_many :companies
  has_many :indicators
  
  has_many :industry_titles
  has_many :users, through: :industry_titles
  accepts_nested_attributes_for :industry_titles
end
