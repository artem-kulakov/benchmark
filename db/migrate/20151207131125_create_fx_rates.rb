class CreateFxRates < ActiveRecord::Migration
  def change
    create_table :fx_rates do |t|
      t.belongs_to :day, index: true
      t.belongs_to :currency, index: true
      t.decimal :rate

      t.timestamps
    end
  end
end
