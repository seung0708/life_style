class CreateDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_entries do |t|
      t.float :serving_size

      t.belongs_to :food, index: true, foreign_key: true
      t.belongs_to :diary, index: true, foreign_key: true
      t.timestamps
    end
  end
end
