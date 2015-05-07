class PlacesController < ApplicationController
	def index
	  @places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params) # sends what the user inputted from form into the DB
		redirect_to root_path  #redirect user back to home
	end


	private
# suck in the values from the user after they press create
	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
