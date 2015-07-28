class Company < ActiveRecord::Base
  belongs_to :industry
  has_many :reports
  
  has_many :values, through: :report
end
