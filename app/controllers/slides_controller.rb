class SlidesController < ApplicationController


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
	end

	def edit
	end

	def update
	end

	#if i use strong params now and remove attr_accessible from model, will that 


	private
      def slide_params
        params.require(:slide).permit!
      end


end
