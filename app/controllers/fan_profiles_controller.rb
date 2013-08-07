class FanProfilesController < ApplicationController
require 'nokogiri'
require 'open-uri'

  def index
  	@user = User.find(current_user.id)
  	puts current_user
  	get_weather
  	puts @temp 

  end

  def show
  end


	def get_weather
		# @user = User.find(current_user.id)
		raw_city = current_user.city
		raw_state = current_user.state
		user_city = raw_city.gsub!(/ /, "+")
		user_state = raw_state.gsub!(/\s+/, "")
		user_state = user_state.gsub!(/[A-Z]{2}/, "+")

	 	url = "www.wunderground.com/weather-forecast/US/#{user_state}/#{user_city}.html"
		@temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
		return
		# puts temp
		# # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
	end

private
      def user_params
        params.require(:user).permit!
      end     
end
