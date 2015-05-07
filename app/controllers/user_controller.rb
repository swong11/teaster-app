

class UserController 
def index
	 @places = Place.paginate(:page => params[:page], :per_page => 2)

end 
end

