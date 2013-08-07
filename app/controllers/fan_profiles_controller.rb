class FanProfilesController < ApplicationController
  require 'nokogiri'
  require 'open-uri'



  def get_weather
      raw_state = current_user.state
      user_state = raw_state.gsub!(/\b\s\b/, "+").gsub!(/\b/, "")
      formatted_state = user_state.gsub!(/ /,"")
      raw_city = current_user.city
      user_city = raw_city.gsub!(/ /, "+")
      @url = "www.wunderground.com/weather-forecast/US/#{formatted_state}/#{user_city}.html"
      @temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
  	render :index
    # return
    # puts temp
    # # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
  end



  def index
    @user = User.find(current_user.id)
    get_weather
  end

  def show
  end

  def get_league
  	#either get json or nokogiri scrape of MLS. Find retrieved tteams locations. USe geocoder to compare to user location
  end



  private
  def user_params
    params.require(:user).permit!
  end
end
