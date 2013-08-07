class HomeController < ApplicationController
	
# skip_before_filter :authenticate_user! , :only => [:index]

before_filter :authenticate_user!
before_filter :user_signed_in?

	def index
  	user_profile = current_user.profile
  	if user_profile == 'Fan'
  		redirect_to :fan_profiles_path
  	elsif 
  		user_profile == 'Parent'
  		redirect_to :parent_profiles_path
  	else
  		#else if NO profile chosen
  		
  		redirect_to :edit_user_registration_path
  	end
	end

end