class AddMissingTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :products, null: false, default: Time.zone.now
    add_timestamps :orders, null: false, default: Time.zone.now
    add_timestamps :order_items, null: false, default: Time.zone.now
  end
end