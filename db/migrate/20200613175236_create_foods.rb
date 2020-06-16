class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calories
      t.float :protein
      t.float :carbohydrates
      t.float :fats  

      t.timestamps
    end
  end
end
