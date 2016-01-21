FactoryGirl.define do
  factory :user do
    password { 'password' }
    password_confirmation { 'password' }

    email { Faker::Internet.email }
    social_name { Faker::Name.name }
    civil_name { Faker::Name.name }
    birth_date { 20.years.ago }
    username { Faker::Internet.user_name }
    phone_number { Faker::PhoneNumber.phone_number }
    name_preference { User::SOCIAL_NAME_PREFERENCE }
  end
end
