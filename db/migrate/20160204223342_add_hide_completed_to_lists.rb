class AddHideCompletedToLists < ActiveRecord::Migration
  def change
    add_column :lists, :hide_completed, :boolean, default: false
  end
end
