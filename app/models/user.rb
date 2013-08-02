class User < ActiveRecord::Base
  # :token_authenticatable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  #relies on protected attributes gem. UntiL I figure out how to customize Devise controller directly which is hidden inside gem apparenty.
  # attr_accessible  :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :location, :picture, :first_name, :city, :state

#find an existing user by uid or create one with a random password otherwise.

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         first_name:auth.info[:first_name],
                         provider:auth.provider,
                         uid:auth.uid,
                         city: auth.info[:location].split(',').first,
                         state: auth.info[:location].split(',').last,
                         picture: auth.info[:image],
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
    end
    user
  end

=begin
Notice that Devise RegistrationsController by default calls "User.new_with_session" before building a resource. 
This means that, if we need to copy data from session whenever a user is initialized before sign up, we just need to implement new_with_session in our model. 

Here is an example that copies the facebook email if available:
=end 

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        # user.location = data["location"] if user.location.blank?
        # user.picture = data["picture"] if user.picture.blank?
      end
    end
  end

end