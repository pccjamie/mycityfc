class FanProfilesController < ApplicationController
require 'nokogiri'
require 'open-uri'

  def index
  	get_weather
  end

  def show
  end


	def get_weather
		@user = User.find(current_user.user_params)
		# @user = User.find(current_user.id)
		raw = current_user.city
		user_city = raw.gsub!(/ /, '+')
		puts user_city
	 #    url = "http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query=#{city}"
		# temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
		# # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
	end

private
      def user_params
        params.require(:user).permit!
      end     
end
