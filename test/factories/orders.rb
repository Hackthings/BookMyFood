FactoryBot.define do
  factory :order do
    association :user, factory: :
    payment_mode { } # TODO: Could not determine appropriate method as per column name. Please use appropriate `Faker::` method
    status { Faker::Demographic.marital_status } # other possible matching fakers are : Faker::Twitter.status
    total { } # TODO: Could not determine appropriate method as per column name. Please use appropriate `Faker::` method
  end
end
