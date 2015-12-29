class Service < ActiveRecord::Base
	has_one :address
	belongs_to :subarea
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :subarea
end
