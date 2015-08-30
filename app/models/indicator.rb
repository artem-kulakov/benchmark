class Indicator < ActiveRecord::Base
  belongs_to :industry
  has_many :values
  
  has_one :formula
  accepts_nested_attributes_for :formula
  
  before_save do
    indicators_ids = Hash[*Indicator.where(industry_id: [industry_id, 0]).collect {|it| [it.title, it.id.to_s]}.flatten]
    self.formula.notation = self.formula.notation.gsub(/(?<=\[)(.+?)(?=\])/, indicators_ids)
  end
end
