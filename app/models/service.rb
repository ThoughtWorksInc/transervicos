class Service < ActiveRecord::Base
	has_one :address
	accepts_nested_attributes_for :address
end
