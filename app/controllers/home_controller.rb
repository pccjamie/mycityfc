class HomeController < ApplicationController
	
 
before_filter :authenticate_user!
before_filter :current_user

  def index
  end

end
