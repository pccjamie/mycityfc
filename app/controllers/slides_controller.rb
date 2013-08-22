class SlidesController < ApplicationController

#before_filter :authenticate_user!

	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'


	def index
		@slides = Slide.all



	end

	def new
		@slide = Slide.new
	end

	def create
		@slide = Slide.create(slide_params)
		if @slide.save
		redirect_to slides_path
		else
		redirect_to new_slide_path
		end
	end

	def show
  		@slide = Slide.find(slide_params) 
  		
		 @player_youth_reg = Nokogiri::HTML(open("http://www.usyouthsoccer.org/media_kit/keystatistics/")).css('.block p')[0].to_html

		#mls vs us pro
    @league_natl_rank = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/Major_League_Soccer_attendance#MLS_average_attendance_vs._other_US_major_sports/")).css('table.wikitable').to_html

   #mls vs intl
    @league_global_rank = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/Major_League_Soccer_attendance")).css('table.wikitable')[3].to_html
 		
	end

	def edit
	end

	def update
	end

	def destroy
	end


	#if i use strong params now and remove attr_accessible from model, will that 

	private
      def slide_params
        params.require(:slide).permit!
      end


end
