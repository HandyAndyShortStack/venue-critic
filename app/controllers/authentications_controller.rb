class AuthenticationsController < ApplicationController
  before_filter :omni_params, except: :home
  before_filter :find_auth, except: :home

  def home
  end

  def twitter
    if @auth || current_user
      sign_in_established_user
    else
      sign_in_new_user
    end
  end

private

  def sign_in_established_user
    if @auth
      flash[:notice] = "Logged in"
      sign_in_and_redirect User.find(@auth.user_id)
    else
      flash[:notice] = "Authenticated successful"
      sign_in_and_redirect current_user.make_authentication(:create, @omni)
    end
  end

  def sign_in_new_user
    user = User.new
    user.make_authentication(:build, @omni)
    if user.save
      flash[:notice] = "Logged in"
      sign_in_and_redirect(:user, user)
    else
      session[:omniauth] = @omni.except('extra')
      redirect_to new_user_registration_path
    end
  end

  def find_auth
    @auth = Authentication.find_by_provider_and_user_id(@omni['provider'], @omni['uid'])
  end

  def omni_params
    @omni = ActionController::Parameters.new(request.env["omniauth.auth"]).permit!
  end

end
