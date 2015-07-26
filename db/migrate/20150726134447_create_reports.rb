class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :company, index: true
      t.belongs_to :period, index: true

      t.timestamps
    end
  end
end
