class AddColumnToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :calories, :integer
  end
end
