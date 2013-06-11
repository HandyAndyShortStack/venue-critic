class AuthenticationsController < ApplicationController
  before_filter :find_authentication, only: [:show, :edit, :update, :destroy]

  def home
  end

  def twitter
    omni = ActionController::Parameters.new(request.env["omniauth.auth"]).permit!
    authentication = Authentication.find_by_provider_and_user_id(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
      current_user.authentications.create!(:provider => omni['provider'],
                                           :user_id => omni['uid'], :token => token,
                                           :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new.apply_omniauth(omni)
      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
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
      redirect_to @authentication, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @authentication.update_attributes(params[:authentication])
      redirect_to @authentication, :notice  => "Successfully updated authentication."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  private

  def find_authentication
    @authentication = Authentication.find(params[:id])
  end

  def authentication_params
    params.require(:authentication).permit!
  end

end
