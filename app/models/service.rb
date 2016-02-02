class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :subarea, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true

  has_one :address, dependent: :destroy
  belongs_to :subarea
  belongs_to :user
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :subarea
  default_scope { order('created_at desc') }

  def owner
    user.preferred_name
  end
end
