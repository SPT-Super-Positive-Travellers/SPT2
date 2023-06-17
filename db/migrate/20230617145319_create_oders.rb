class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      
      t.integer :customer_id,   null: false
      t.string  :name,          null: false
      t.string  :postal_code,   null: false
      t.string  :address,       null: false
      t.integer :delivery_fee,  null: false
      t.integer :payment,       null: false
      t.integer :amount_billed, null: false
      t.integer :status,        null: false, default: 0

      t.timestamps
    end
  end
end
