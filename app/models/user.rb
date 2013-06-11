class User < ActiveRecord::Base
  # refactor build and create methods to eleminate redundancy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  def make_authentication(method, omni)
    authentications.send(method, {  :provider => omni['provider'],
                                    :user_id => omni['uid'],
                                    :token => omni['credentials']['token'],
                                    :token_secret => omni['credentials']['secret']})
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  has_many :reviews
  has_many :authentications
end
