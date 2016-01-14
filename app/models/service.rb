class Service < ActiveRecord::Base
  validates :subarea, presence: true
  validates :address, presence: true

  has_one :address
  belongs_to :subarea
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :subarea
end
