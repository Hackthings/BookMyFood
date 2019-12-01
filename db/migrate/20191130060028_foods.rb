class Foods < ActiveRecord::Migration[5.2]
  def change
  	create_table :foods do |t|
      ## Database authenticatable
      t.string :name,              null: false, default: ""
      t.float :price, null: false
      t.integer :available, null:false, default: 0

    end
  end
end
