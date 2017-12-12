class AttractionsController < ApplicationController

	def new
		@attraction = Attraction.new
	end

	def create
    attraction = Attraction.new(attraction_params)
    if attraction.save 
    	redirect_to attraction_path(attraction)
    else
    	redirect_to attractions_path 
    end
	end

	
	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
  	@attraction= Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
	end

private

	def attraction_params
		params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
	end
end
  