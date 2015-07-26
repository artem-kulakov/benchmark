class IndustryIndicator < ActiveRecord::Base
  belongs_to :industry
  belongs_to :indicator
end
