class FanProfilesController < ApplicationController


  # def set_access_control_headers
  #   headers["Access-Control-Allow-Origin"] = "*"
  #   headers["Access-Control-Request-Method"] = "*"
  # end

  # after_filter :set_access_control_headers


# uncomment for  localhost testing
# skip_before_filter :authenticate_user!
  
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'

  def index
  	@user = User.find(current_user.id)
    get_weather
    get_leagues
    get_news
  end

  def show
  end

  def get_weather
    state = current_user.state.gsub!(/\s{1}/o, "")
    @state = state
    city = current_user.city.gsub!(/\s+(?!^)(?=[A-Z])/, "%20")
    @city = city
    # # url = "http://wunderground.com/weather-forecast/US/#{state}/#{city}.html"
    # weather = Nokogiri::HTML(open("http://weather.weatherbug.com/#{state}/#{city}-weather.html")).css("#divTemp").text
    # @weather = weather
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
