class MigrationsController < Devise::RegistrationsController

  def sign_up_params
    params.require(:user).permit(:social_name, :civil_name, :birth_date, :username, :email, :phone_number, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:social_name, :civil_name, :birth_date, :username, :email, :phone_number, :password, :password_confirmation, :current_password)
  end
end
