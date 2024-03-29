class Order < ApplicationRecord
  enum status: { draft: 0, placed: 1, payment_confirmed: 2, preparing: 3, prepared: 4, delivered: 5 }
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: proc { |oi| oi[:quantity] == '0' }
end
