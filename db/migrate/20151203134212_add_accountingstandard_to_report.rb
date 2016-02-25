class AddAccountingstandardToReport < ActiveRecord::Migration
  def change
    add_reference :reports, :gaap, index: true
  end
end
