class CreateGaaps < ActiveRecord::Migration
  def change
    create_table :gaaps do |t|
      t.string :title

      t.timestamps
    end
  end
end
