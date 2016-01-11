class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :name_presence
  validate :age

  validates :terms_of_service, acceptance: true
  validates :username, uniqueness: true

  def name_presence
    if social_name.blank? and civil_name.blank?
        errors.add(:_, "É preciso informar ao menos um nome.")
    end
  end

  def age
    today = Date.current()

    if birth_date.blank?
        errors.add(:__, "É preciso informar uma data de nascimento.")
        return
    end

    if (birth_date + 18.years) > today
        errors.add(:_, "É preciso ser maior de idade.")
        return
    end
  end
end
