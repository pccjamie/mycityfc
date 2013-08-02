class HomeController < ApplicationController
	
 
skip_before_filter :authenticate_user! , :only => [:index]
before_filter :current_user

  def index
  end


end
