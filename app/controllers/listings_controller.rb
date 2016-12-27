class ListingsController < ApplicationController

def show
	@listing = Listing.find(params[:id])
 end


	def new
	@listing = Listing.new
	end

	def create 
		# @user = User.find(params[:user_id])
		@listing = Listing.create(listing_params)
		@listing.user_id = current_user.id
		# byebug
		if @listing.save
			redirect_to new_listing_path
			    flash[:notice] = "successfully Added Listing"	
    	end
	end

	private

def listing_params
params.require(:listing).permit(:property_name, :stars, :address, :room_number, :price, :user_id)

end

end
