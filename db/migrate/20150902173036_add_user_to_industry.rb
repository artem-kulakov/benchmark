class AddUserToIndustry < ActiveRecord::Migration
  def change
    add_reference :industries, :user, index: true
  end
end
