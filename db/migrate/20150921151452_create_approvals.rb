class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.belongs_to :version, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
