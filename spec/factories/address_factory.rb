FactoryGirl.define do
  factory :address do
    city { FactoryGirl.create(:city) }
    state { FactoryGirl.create(:state) }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Address.street_name }
  end
end
