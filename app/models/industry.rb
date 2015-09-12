class Industry < ActiveRecord::Base
  has_many :companies
  has_many :indicators
  
  has_many :industry_titles
  accepts_nested_attributes_for :industry_titles
  
  def self.own(current_user_id)
    # find_by_sql("SELECT * FROM industries WHERE initial_id IN
    #   (SELECT initial_id FROM industries GROUP BY initial_id HAVING COUNT(*) = 1)
    #   OR
    #   ((SELECT initial_id FROM industries GROUP BY initial_id HAVING COUNT(*) = 2)
    #     AND user_id = #{current_user_id})
    # ")
    
    find_by_sql("SELECT * 
      FROM industries
    ")
  end
end
