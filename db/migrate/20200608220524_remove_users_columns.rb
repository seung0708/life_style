class RemoveUsersColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :street_address
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
  end
end
