class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy] #filter to only allow signed in users to create new places and edit

	def index	
	  @places = Place.order(:name).page(params[:page]) 
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params) # sends what the user inputted from form into the DB
		redirect_to root_path  #redirect user back to home
	end

# create a place that is connected by a particular user
	def create
  		@place = current_user.places.create(place_params)
  		if @place.valid?
  			redirect_to root_path
  		else 
  			render :new, :status => :unprocessable_entity
  		end
	end

#tell the controller how to find the correct place by passing in the id of each place
	def show
		@place = Place.find(params[:id]) 
		@comment = Comment.new
		@photo = Photo.new
	end

	def edit
		@place = Place.find(params[:id])

		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden 
		end
	end

	def update
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden 
		end
		@place.update_attributes(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :edit, :stats => :unprocessable_entity
		end		
	end	

	def destroy
		@place = Place.find(params[:id])
		if @place.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		
		@place.destroy
		redirect_to root_path
	end

	private
# suck in the values from the user after they press create
	def place_params
		params.require(:place).permit(:name, :description, :address)
	end


end
