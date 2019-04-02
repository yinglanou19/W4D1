class AddColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:email
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
  
end
