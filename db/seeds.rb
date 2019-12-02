# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if Rails.env.development?
  20.times do
    p = Product.new
    p.name = Faker::Food.dish
    p.quantity = (1..10).to_a.sample
    p.unit = Product.units.keys.sample
    p.price = (10..100).to_a.sample
    p.availability = [true, false].sample
    p.save
  end
end
