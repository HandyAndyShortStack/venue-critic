class AuthenticationsController < ApplicationController
  before_filter :find_authentication, only: [:show, :edit, :update, :destroy]

  def home
  end

  def twitter
    @omni = ActionController::Parameters.new(request.env["omniauth.auth"]).permit!
    authentication = Authentication.find_by_provider_and_user_id(@omni['provider'], @omni['uid'])
    if authentication || current_user
      sign_in_established_user(authentication)
    else
      sign_in_new_user
    end
  end

private

  def sign_in_established_user(authentication)
    if authentication
      flash[:notice] = "Logged in"
      sign_in_and_redirect User.find(authentication.user_id)
    else
      flash[:notice] = "Authenticated successful"
      sign_in_and_redirect current_user.make_authentication(:create, @omni)
    end
  end

  def sign_in_new_user
    user = User.new
    if user.save
      user.make_authentication(:build, @omni)
      flash[:notice] = "Logged in"
      sign_in_and_redirect User.find(user.id)
    else
      session[:omniauth] = @omni.except('extra')
      redirect_to new_user_registration_path
    end
  end

  def find_authentication
    @authentication = Authentication.find(params[:id])
  end

  def auth_params
    params.require(:authentication).permit!
  end

end
