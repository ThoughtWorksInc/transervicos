FactoryGirl.define do 
	factory :service do 
		address
	    area { Faker::Commerce.department }
	    subarea { Faker::Commerce.department }
	    name { Faker::Commerce.product_name }
	    description { Faker::Lorem.paragraph(2) }
	    phone { Faker::PhoneNumber.phone_number }
	end
end