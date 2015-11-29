class Indicator < ActiveRecord::Base
  belongs_to :industry
  has_many :values
  
  has_one :formula
  accepts_nested_attributes_for :formula
  
  before_save do
    if self.formula
      # Create hash {title: id, title: id}
      indicators_ids = Hash[*Indicator.where(industry_id: [industry_id, 0]).collect {|it| [it.title, it.id.to_s]}.flatten]
    
      # Replace indicator titles by ids in formula
      self.formula.notation = self.formula.notation.gsub(/(?<=\[)(.+?)(?=\])/, indicators_ids)
    end
  end
end
