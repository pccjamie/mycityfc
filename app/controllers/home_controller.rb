class HomeController < ApplicationController
	
 
before_filter :authenticate_user!
before_filter :current_user

  def index
  	p'you are on the controller page'
  end



# FOR WHEN I SWITCH TO USING STORNG PARMETERS

  # private
  #   def user_params
  #     params.require(:person).permit(:provider, :uid, :name)
  #   end

end
