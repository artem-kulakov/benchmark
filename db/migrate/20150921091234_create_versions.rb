class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.belongs_to :report, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
