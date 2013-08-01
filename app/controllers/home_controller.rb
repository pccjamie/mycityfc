class HomeController < ApplicationController

  #relies on protected attributes gem. UntiL I figure out how to customize Devise controller directly which is hidden inside gem apparenty.
 
attr_accessible  :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :location, :picture, :first_name, :city, :state

 
before_filter :authenticate_user!
before_filter :user_signed_in?

  def index
  	p'you are on the controller page'
  end



# FOR WHEN I SWITCH TO USING STORNG PARMETERS

  private
    def user_params
      params.require(:person).permit(:provider, :uid, :name)
    end

end
