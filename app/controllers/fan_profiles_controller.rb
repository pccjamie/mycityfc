class FanProfilesController < ApplicationController
require 'nokogiri'
require 'open-uri'

  def index
  	@user = User.find(current_user.id)
  	puts current_user
  	get_weather
  	return @temp
end

  def show
  end

  def get_coordinates




  end


	def get_weather
		if current_user.city
		# @user = User.find(current_user.id)
		raw_state = current_user.state
		user_state = raw_state.gsub!(/\b\s\b/, "+").gsub!(/\b{0}/, "")
		puts user_state
		raw_city = current_user.city
		user_city = raw_city.gsub!(/ /, "+")
	 	url = "www.wunderground.com/weather-forecast/US/#{user_state}/#{user_city}.html"
		@temp = Nokogiri.HTML(open(url).css('#nowTemp, b')).to_html
		else
			render :nothing
		end
		# return
		# puts temp
		# # rain = Nokogiri.HTML(open(url).css('#curCond , #conds_details_cur, b')).to_html
	end

private
      def user_params
        params.require(:user).permit!
      end     
end
