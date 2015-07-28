class Period < ActiveRecord::Base
  has_many :reports
  
  has_many :values, through: :report
end
