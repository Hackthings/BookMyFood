class Product < ApplicationRecord
  has_one_attached :image
  enum unit: { pcs: 0, g: 1, ml: 2, plt: 3 }
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true, inclusion: { in: Product.units.keys }
end
