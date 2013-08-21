class HomeController < ApplicationController
	
# skip_before_filter :authenticate_user!, :only => [:index]
before_filter :authenticate_user!, :except => [:splash]
before_filter :user_signed_in?, :except => [:splash]

	def index
    current_user
  	if current_user.profile == 'Fan'
  		redirect_to :fan_profiles
  	elsif 
  		current_user.profile == 'Parent'
  		redirect_to :parent_profiles
  	else
  		
  	end
	end

  def splash
    # flash[:notice] = "I am a splash page"
  end

end