class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :orders, index: true, foreign_key: true
      t.references :products, index: true, foreign_key: true
      t.integer :quantity, null: false, default: 1
    end
  end
end