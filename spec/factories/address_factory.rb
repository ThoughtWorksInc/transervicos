FactoryGirl.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end
