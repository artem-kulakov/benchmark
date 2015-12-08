class Currency < ActiveRecord::Base
  has_many :fx_rates
  has_many :values
end
