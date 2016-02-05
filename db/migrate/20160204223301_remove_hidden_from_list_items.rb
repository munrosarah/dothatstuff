class RemoveHiddenFromListItems < ActiveRecord::Migration
  def change
    remove_column :list_items, :hidden
  end
end
