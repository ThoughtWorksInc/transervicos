FactoryGirl.define do
  factory :service, class: Service do
    association :address, factory: :address, strategy: :create
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(2) }
    phone { Faker::PhoneNumber.phone_number }
    owner_name { Faker::Name.name }
    owner_email { Faker::Internet.email }
    association :subarea, factory: :subarea_education_college, strategy: :create
    association :user, factory: :user, strategy: :create
  end

  factory :service_without_subarea, class: Service do
    address
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(2) }
    phone { Faker::PhoneNumber.phone_number }
  end

  factory :service_without_address, class: Service do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(2) }
    phone { Faker::PhoneNumber.phone_number }
  end
end
