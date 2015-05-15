class PhotosController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_params.merge(:user => current_user))
		redirect_to place_path(@place)
	end

#pull the data out of the photos form
	private

	def photo_params
		params.require(:photo).permit(:caption)		
	end
end
