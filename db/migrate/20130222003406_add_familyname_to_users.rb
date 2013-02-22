class AddFamilynameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :familyname, :string
  end
end
