class AddAccountingstandardToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :accounting_standard, index: true
  end
end
