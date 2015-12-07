class FxRate < ActiveRecord::Base
  belongs_to :day
  belongs_to :currency
end
