class MatchesController < ApplicationController



require 'httparty'

before_filter :authenticate_user!


	def index
		@matches = Match.all
	end

	def new
		@match = Match.new
	end

	def create
		@match = Match.create(match_params)
		if @match.save
		redirect_to matches_path
		else
		redirect_to new_match_path
		end
	end

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
