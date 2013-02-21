class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.integer :level
      t.string :group

      t.timestamps
    end
  end
end
