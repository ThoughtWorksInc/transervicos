FactoryGirl.define do
  factory :city do
    state { FactoryGirl.create(:state) }
    name { Faker::Address.city }
  end
end
