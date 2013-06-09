class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :admin, :email, :password, :password_confirmation)
  end
  private :resource_params
end

