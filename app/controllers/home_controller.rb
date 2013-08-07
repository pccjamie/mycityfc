class HomeController < ApplicationController
	
# skip_before_filter :authenticate_user! , :only => [:index]

before_filter :authenticate_user!

before_filter :current_user

	def index
  # 	user_profile = current_user.profile
  # 	if user_profile == 'Fan'
  # 		redirect_to :fan_profiles_path

  # 	else
  # 		redirect_to :parent_profiles_path

  # end
	end

end