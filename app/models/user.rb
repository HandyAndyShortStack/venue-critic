class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  def make_authentication(method, omni)
    self.authentications.send(method, {
      user_id: self.id,
      provider: omni['provider'],
      uid: omni['uid'].to_s,
      token: omni['credentials']['token'],
      token_secret: omni['credentials']['secret']})
  end

  def email_required?
    super
    # super && provider.blank?
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
  has_many :venues
  has_many :authentications
end

