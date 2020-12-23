class CreateDiaryEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :diary_entries do |t|
      t.float :serving_size

      t.references :food
      t.references :diary
      t.timestamps
    end
  end
end
