class AddHiddenToListItems < ActiveRecord::Migration
  def change
      add_column :list_items, :hidden, :boolean, default: false
  end
end
