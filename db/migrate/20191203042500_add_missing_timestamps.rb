class AddMissingTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :products
    add_timestamps :orders
    add_timestamps :order_items
  end
end