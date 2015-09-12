class IndustryTitle < ActiveRecord::Base
  belongs_to :industry
  belongs_to :user
end
