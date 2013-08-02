class SlidesController < ApplicationController

before_filter :authenticate_user!, :only [:show]

	def index
		@slides = Slide.all
	end

	def new
	end

	def create
	end

	def show
	end



end
