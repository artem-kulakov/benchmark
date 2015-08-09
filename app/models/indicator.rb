class Indicator < ActiveRecord::Base
  belongs_to :industry
  has_many :values
end
