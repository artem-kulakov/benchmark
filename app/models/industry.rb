class Industry < ActiveRecord::Base
  has_many :companies
  has_many :indicators
end
