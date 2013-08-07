class FanProfilesController < ApplicationController
require 'nokogiri'
require 'open-uri'


  def index
  	city = current_user.city
  	get_weather
  	return
  end

  def show
  end

  def get_location
	# city = current_user.city
  end

	def get_weather
	
	    url = "http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query=#{city}"

		temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
		rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html

		return

	end



end
