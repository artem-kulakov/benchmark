class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :day

      t.timestamps
    end
  end
end
