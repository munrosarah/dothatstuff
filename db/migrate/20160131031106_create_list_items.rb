class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :description, null: false
      t.boolean :completed, default: false

      t.integer :user_id, index: true, null: false
      t.integer :list_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
