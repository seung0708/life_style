class CreateDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_entries do |t|
      t.float :serving_size

      t.references :food, foreign_key: {on_delete: :cascade}
      t.references :diary, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
