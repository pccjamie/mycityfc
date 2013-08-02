class HomeController < ApplicationController
	
 
before_filter :authenticate_user!
before_filter :current_user


  before_filter :devise_parameter_sanitizer, if: :devise_controller?

	

  def index
  	p'you are on the controller page'
  end




  #relies on lib/user_sanitizer.rb
  protected
	
	def devise_parameter_sanitizer
	    if resource_class == User
	      User::ParameterSanitizer.new(User, :user, params)
	    else
	      super
	    end
	end




# FOR WHEN I SWITCH TO USING STORNG PARMETERS

  # private
  #   def user_params
  #     params.require(:person).permit(:provider, :uid, :name)
  #   end

end
