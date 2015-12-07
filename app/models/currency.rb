class Currency < ActiveRecord::Base
  has_many :fx_rates
end
