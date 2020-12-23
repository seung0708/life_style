class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.datetime :date
      t.references :user


      t.timestamps
    end
  end
end
