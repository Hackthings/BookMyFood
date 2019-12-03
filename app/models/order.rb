class Order < ApplicationRecord
  enum status: { new: 0, placed: 1, payment_confirmed: 2, preparing: 3, prepared: 4, delivered: 5 }
end
