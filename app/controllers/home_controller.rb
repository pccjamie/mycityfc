class HomeController < ApplicationController
 
before_filter :authenticate_user!
before_filter :user_signed_in?

  def index
  end




  # private
  #   def user_params
  #     params.require(:person).permit(:provider, :uid, :name)
  #   end

end
