class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  def build_resource(*args)
      super
      if session[:omniauth]
        @user.make_authentication(:build, session[:omniauth])
        @user.valid?
      end
  end

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  def resource_params
    params.require(:user).permit(:name, :admin, :email, :password, :password_confirmation)
  end
  private :resource_params
end

