class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title

      t.integer :user_id, null: false

      t.timestamps null: false
    end

    # For now, users can only have one list
    add_index :lists, :user_id, unique: true
  end
end
