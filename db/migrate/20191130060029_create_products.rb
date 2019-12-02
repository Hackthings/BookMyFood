class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.float :price, null: false, default: 0
      t.boolean :availability, default: false
      t.integer :quantity, default: 0
      t.integer :unit, default: 0
    end
  end
end
