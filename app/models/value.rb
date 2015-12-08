class Value < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :version
  
  has_one :company, through: :report
  has_one :period, through: :report
  
  belongs_to :user
  
  belongs_to :currency
end
