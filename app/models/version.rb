class Version < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
  
  has_many :values
  accepts_nested_attributes_for :values
end
