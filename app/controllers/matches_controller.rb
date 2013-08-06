class MatchesController < ApplicationController

require 'httparty'

	def index
		@matches = Match.all
	end

	def new
		@match = Match.new
	end

	# def create
	# 	@slide = Slide.create(slide_params)
	# 	if @slide.save
	# 	redirect_to slides_path
	# 	else
	# 	redirect_to new_slide_path
	# 	end
	# end

	def show
  		@match = Match.find(match_params)  		
	end

	def edit
	end

	def update
	end

	def destroy
		#needs logic for removing match info after a certain amount of time
	end


	#if i use strong params now and remove attr_accessible from model, will that 

	private
      def match_params
        params.require(:match).permit!
      end



end
