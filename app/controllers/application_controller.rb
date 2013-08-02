class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :devise_parameter_sanitizer, if: :devise_controller?

	before_filter :authenticate_user!


  #relies on lib/user_sanitizer.rb
  protected
	
	def devise_parameter_sanitizer
	    if resource_class == User
	      User::ParameterSanitizer.new(User, :user, params)
	    else
	      super
	    end
	end

end
