class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :birth_date, presence: { message: 'É preciso informar uma data de nascimento.' }
  validates :terms_of_service, acceptance: true
  validates :username, uniqueness: true
  validate :age
  validate :name_presence

  attr_accessor :birth_date_picker

  def name_presence
    errors.add(:_, 'É preciso informar ao menos um nome.') if social_name.blank? && civil_name.blank?
  end

  def age
    today = Date.current
    errors.add(:_, 'É preciso ser maior de idade.') if (birth_date + 18.years) > today
  end
end
