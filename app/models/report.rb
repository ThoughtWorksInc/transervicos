class Report < ActiveRecord::Base
  belongs_to :service
  validates :detail, presence: true
  validates :service, presence: true
end
