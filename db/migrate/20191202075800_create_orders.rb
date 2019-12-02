class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :payment_mode, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.float :total, null: false, default: 0
    end
  end
end
