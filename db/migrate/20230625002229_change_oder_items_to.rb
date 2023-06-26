class ChangeOderItemsTo < ActiveRecord::Migration[6.1]
  def change
    rename_table :oder_items, :order_items
  end
end
