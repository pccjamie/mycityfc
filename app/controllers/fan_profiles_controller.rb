class FanProfilesController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'httparty'



  def index
    get_weather
    get_league
  end

  def show
  end

  def get_weather
    puts "showing weather"

    # state = current_user.state.gsub!(/\b\s\b/, "+").gsub!(/\b/, "")
    # state = state.gsub!(/ /,"")
    # # city = current_user.city.gsub!(/ /, "+")
    # puts state
    # puts city
    # url = "www.wunderground.com/weather-forecast/US/#{state}/#{user_city}.html"
    # puts @url
    #  # @temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
    # # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
  end



  def get_league
    puts "showing leagues"
    # url = JSONHTTP GET "http://api.espn.com/:version/:resource/:method?apikey=:yourkey"
    #either get json or nokogiri scrape of MLS. Find retrieved tteams locations. USe geocoder to compare to user location
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
