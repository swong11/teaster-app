class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.comments.create(comment_params.merge(:user => current_user))
		redirect_to place_path(@place)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end


#1 Require user to be logged in
#2 Load place that the comment belongs to
#3 Create an item for a comment in our DB that's connected to the place we loaded.
#4 Connect which user made this comment by using merge method

# merge connects two dictionaries
	# dictionary: "a data structure" [Hash table] (e.g. {:hello => 'awesome'})