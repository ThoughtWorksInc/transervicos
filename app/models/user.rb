class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :birth_date, presence: { message: 'É preciso informar uma data de nascimento.' }
  validates :terms_of_service, acceptance: true
  validates :username, uniqueness: true, presence: true
  validate :age
  validate :name_presence
  has_many :services

  SOCIAL_NAME_PREFERENCE = 'S'
  CIVIL_NAME_PREFERENCE = 'C'

  attr_accessor :birth_date_picker

  def name_presence
    errors.add(:_, 'É preciso informar ao menos um nome.') if social_name.blank? && civil_name.blank?
  end

  def age
    today = Date.current
    return if birth_date && (birth_date + 18.years) < today
    errors.add(:_, 'É preciso ser maior de idade.')
  end

  def preferred_name
    if name_preference == CIVIL_NAME_PREFERENCE
      return civil_name.nil? ? social_name : civil_name
    elsif name_preference == SOCIAL_NAME_PREFERENCE
      return social_name.nil? ? civil_name : social_name
    end
  end
end
