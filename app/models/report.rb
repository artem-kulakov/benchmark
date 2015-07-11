class Report < ActiveRecord::Base
  validates :company, :period, :revenues, presence: true
  validates :revenues, numericality: {greater_than_or_equal_to: 0}
end
