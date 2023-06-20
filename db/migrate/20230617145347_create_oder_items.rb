class CreateOderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_items do |t|
      
      t.integer :item_id,  null: false
      t.integer :order_id, null: false
      t.integer :count,    null: false
      t.integer :price,    null: false
      t.integer :status,   null: false, default: 0

      t.timestamps
    end
  end
end
