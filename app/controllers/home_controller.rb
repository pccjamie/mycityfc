class HomeController < ApplicationController
	
skip_before_filter :authenticate_user! , :only => [:index]
before_filter :user_signed_in?

  def index
  end

end
