class HomeController < ApplicationController
	
# skip_before_filter :authenticate_user!, :only => [:index]
# before_filter :user_signed_in?

# before_filter :authenticate_user!, :except => [:splash], :unless => :user_signed_in?

#no actual index view for now. this redirects to one of two paths after they've signed in and set up profile

	def index
    current_user
  	if current_user.profile == 'Fan'
  		redirect_to :fan_profiles
  	elsif 
  		current_user.profile == 'Parent'
  		redirect_to :parent_profiles
  	else
  		redirect_to :index
      # flash[:alert] = 'I am home. No profile.'
  	end
	end

  def splash
    flash[:alert] = 'I am splashing'
  end

end