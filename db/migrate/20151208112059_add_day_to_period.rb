class AddDayToPeriod < ActiveRecord::Migration
  def change
    add_reference :periods, :day, index: true
  end
end
