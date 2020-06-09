class CreateDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_entries do |t|
      t.integer :user_id
      t.integer :food_id
      t.datetime :date
      t.decimal :quantity

      t.timestamps
    end
  end
end
