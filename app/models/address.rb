class Address < ActiveRecord::Base
  belongs_to :service
  validates :city, presence: true
  validates :state, presence: true
end
