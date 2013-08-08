class ParentProfilesController < ApplicationController


  before_filter :authenticate_user!
  #uncomment for  localhost testing
  #skip_before_filter :authenticate_user!

  def index
  end

  def show
  end


end
