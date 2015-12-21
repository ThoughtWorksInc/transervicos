class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :name_presence

  validates :terms_of_service, acceptance: true

  def name_presence
    if social_name.blank? and civil_name.blank?
        errors.add(:_, "É preciso informar ao menos um nome.")
    end
  end
end
