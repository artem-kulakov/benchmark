class Day < ActiveRecord::Base
  has_many :fx_rates
  has_many :periods
end
