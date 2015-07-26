class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
end
