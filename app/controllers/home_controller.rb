class HomeController < ApplicationController
	
# skip_before_filter :authenticate_user!, :only => [:index]
# before_filter :user_signed_in?
# before_filter :authenticate_user!
  
	def index
   #  current_user
  	# if current_user.profile == 'Fan'
  	# 	redirect_to :fan_profiles
  	# elsif 
  	# 	current_user.profile == 'Parent'
  	# 	redirect_to :parent_profiles
  	# else
  	# 	#else if NO profile chosen
  	# 	#redirect_to :edit_user_registration_path
  	# end
	end

end