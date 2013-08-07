class FanProfilesController < ApplicationController


  def set_access_control_headers
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Request-Method"] = "*"
  end
  
# uncomment for  localhost testing
# skip_before_filter :authenticate_user!
  
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'

	# respond_to :json

  def index
    get_weather
    get_leagues
    get_news
  end

  def show
  end

  def get_weather
  	# @user = User.find(current_user.id)
    @weather = "showing weather"
    # state = current_user.state.gsub!(/\b\s\b/, "+").gsub!(/\b/, "")
    # state = state.gsub!(/ /,"")
    # city = current_user.city.gsub!(/ /, "+")
    #@state = state 
    # @city = city
    # url = "www.wunderground.com/weather-forecast/US/#{state}/#{user_city}.html"
    # puts @url
    #  # @temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
    # # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
  	return
  end



  def get_leagues
    @leagues = "showing leagues"
 		return
  end

  def get_news
  	@news = "showing news"
  	return
  end


  private
  def user_params
    params.require(:user).permit!
  end
end
