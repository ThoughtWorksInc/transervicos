class Address < ActiveRecord::Base
  belongs_to :service
  belongs_to :state
  belongs_to :city

  validates :city_id, presence: true
  validates :state_id, presence: true
end
