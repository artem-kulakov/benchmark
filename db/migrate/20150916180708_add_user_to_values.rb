class AddUserToValues < ActiveRecord::Migration
  def change
    add_reference :values, :user, index: true
  end
end
