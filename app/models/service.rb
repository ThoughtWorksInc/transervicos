class Service < ActiveRecord::Base
  validates :subarea, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true

  has_one :address
  belongs_to :subarea
  belongs_to :user
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :subarea
end
