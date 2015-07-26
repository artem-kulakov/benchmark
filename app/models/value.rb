class Value < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :report
end
