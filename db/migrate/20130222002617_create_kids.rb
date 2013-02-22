class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.integer :family_id
      t.string :name
      t.string :charactor_img
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
