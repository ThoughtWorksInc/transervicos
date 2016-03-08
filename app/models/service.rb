class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :subarea, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true

  validates :website, format: {
    with: %r{\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z}i,
    message: 'Site deve estar no formato: www.meusite.com.br'
  }, if: proc { |a| a.website.present? }

  has_one :address, dependent: :destroy
  belongs_to :subarea
  belongs_to :user

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :subarea

  default_scope { order('created_at desc') }

  before_save { |service| service.website = url_with_protocol(service.website) unless service.website.blank? }

  def owner
    user.preferred_name
  end

  private

  def url_with_protocol(url)
    /^https?/i.match(url) ? url : "http://#{url}"
  end
end
