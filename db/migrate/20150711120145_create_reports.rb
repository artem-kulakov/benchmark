class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :company
      t.string :period
      t.integer :revenues

      t.timestamps
    end
  end
end
