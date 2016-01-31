class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title

      # For now, users can only have one list
      t.integer :user_id, index: true, null: false, unique: true

      t.timestamps null: false
    end
  end
end
