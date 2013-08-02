class SlidesController < ApplicationController

before_action :authenticate_user!, :only [:index,:show]

	def index
		@slides = Slide.all
	end

	def new
		@slide = Slide.new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	#if i use strong params now and remove attr_accessible from model, will that 



end
