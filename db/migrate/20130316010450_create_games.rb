class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :kid_id
      t.integer :points
      t.datetime :created_at

      t.timestamps
    end
  end
end
