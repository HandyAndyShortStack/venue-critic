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

  def index
    @authentications = Authentication.all
  end

  def show
  end

  def new
    @authentication = Authentication.new
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to @authentication, :notice => "authentication created."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @authentication.update_attributes(params[:authentication])
      redirect_to @authentication, :notice  => "authentication updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @authentication.destroy
    redirect_to authentications_url, :notice => "authentication destroyed"
  end

private
  def sign_in_established_user(authentication)
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    else
      flash[:notice] = "Authenticated successful."
      sign_in_and_redirect current_user.make_authentication(:create!, @omni)
    end
  end

  def sign_in_new_user
    user = User.new.make_authentication(:build, @omni)
    if user.save
      flash[:notice] = "Logged in."
      sign_in_and_redirect User.find(user.id)
    else
      session[:omniauth] = @omni.except('extra')
      redirect_to new_user_registration_path
    end
  end

  def find_authentication
    @authentication = Authentication.find(params[:id])
  end

  def authentication_params
    params.require(:authentication).permit!
  end

end
