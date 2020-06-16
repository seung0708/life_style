class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.datetime :date
      t.belongs_to :user, index: true, foreign_key: {on_delete: :cascade}
      
      
      t.timestamps
    end
  end
end
