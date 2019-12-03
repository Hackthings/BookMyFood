class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items
  enum unit: { pcs: 0, g: 1, ml: 2, plt: 3 }
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, inclusion: { in: Product.units.keys }

  def availability_label
    availability? ? 'Available' : 'Out of Stock'
  end
end
