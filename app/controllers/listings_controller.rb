class ListingsController < ApplicationController


def index
	@user = User.find_by_id(params[:user_id])
	 @listing = User.find_by_id(params[:user_id]).listings.paginate(:page => params[:page], per_page: 2)

end

	def show
	# @listing = Listing.all
	 @listing = Listing.where(user_id: current_user.id)
	 	 # @listing.paginate(:page => params[:page] per_page: 2)
   	end

def destroy
	# @user = User.find_by_id(:id)
	 	@user = User.find_by_id(params[:user_id])

	if @user == current_user
@listing = Listing.destroy(params[:id])
redirect_to user_listings_path(current_user)
flash[:notice] = "Gone Bro!!!!!"
else
	redirect_to user_listings_path(current_user)
flash[:notice] = "Not your business "

	end
end
  def edit
	@listing = Listing.find(params[:id])
 	@user = User.find_by_id(params[:user_id])

  end

  def update

@listing = Listing.find(params[:id])
 # @user = User.find_by_id(params[:user_id])
	 # if @user == current_user
 	# byebug
  		 @listing.update(listing_params_edit)
   			redirect_to user_listings_path(current_user)
   		# else
   		# 	redirect_to user_listings_path(current_user)
   		# flash[:notice] = "this not you business"		
  # end
end

	def new
	# if not signed, redirect to login page.
	@listing = current_user.listings.new
	end

	def create 
		 # @user = User.find(params[:user_id])
		# @listing = Listing.create(listing_params)
		# @listing.user_id = current_user.id
		# byebug
		@listing = current_user.listings.new(listing_params)
		# byebug
		if @listing.save
			redirect_to user_listings_path
			    flash[:notice] = "successfully Added Listing"	
    	end
	end

	private
		def listing_params_edit
		params.require(:listing).permit(:property_name, :stars, :address, :room_number, :price, {avatars: []})
		end
	def listing_params
	params.require(:listing).permit(:property_name, :stars, :address, :room_number, :price, :user_id, :is_smoker, :is_internet, :is_pet)

 	  		


	end

end
