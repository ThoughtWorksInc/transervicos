FactoryGirl.define do
	factory :service do
		address
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(2) }
    phone { Faker::PhoneNumber.phone_number }
	end
end
