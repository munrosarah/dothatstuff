class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :description, null: false
      t.boolean :completed, default: false

      t.integer :user_id, null: false
      t.integer :list_id, null: false

      t.timestamps null: false
    end

    add_index :list_items, :user_id, unique: false
    add_index :list_items, :list_id, unique: false
  end
end
