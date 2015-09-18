class Value < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :report
  
  has_one :company, through: :report
  has_one :period, through: :report
  
  belongs_to :user
end
