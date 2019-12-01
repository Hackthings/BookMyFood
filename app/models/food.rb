class Food < ApplicationRecord
  # Add model sections' pointers
  [:attributes, :attributes=, :field_type, :field_type_by_name,
    :invoke_with_padding, :options, :options=]
  has_one_attached :image
end
