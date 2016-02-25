class Address < ActiveRecord::Base
  belongs_to :service
  belongs_to :state
  belongs_to :city

  validates_with CityValidator
  validates_with StateValidator
end
