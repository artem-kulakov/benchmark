class CreateAccountingStandards < ActiveRecord::Migration
  def change
    create_table :accounting_standards do |t|
      t.string :title

      t.timestamps
    end
  end
end
