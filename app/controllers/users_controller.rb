class UsersController < Clearance::UsersController

						# ApplicationController
	before_action :require_login, only: [:show] 


	def require_login
		unless signed_in?
			flash[:error] = "You must be logged in to access this section"
			 redirect_to sign_in
		end
	end

	def show
		@user = User.find_by_id(params[:id])
		@listing = @user.listings.paginate(:page => params[:page], per_page: 2)
	end

# 	def index
# 		@user = User.all
# 	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		sign_in(@user)
			redirect_to user_path(@user)
			    flash[:notice] = "Account successfully created"

		else
			render 'new'
		end
	end
		
		def edit
			@user = User.find(params[:id])
		end 

				def update
					@user = User.find(current_user)
					@user.update(user_params_edit)
				    flash[:notice] = "Account successfully Edited"

					respond_to do |format|
						format.html{redirect_to edit_user_path(current_user)}
		 				format.js
		 				# if @user.save
							# redirect_to edit_user_path(current_user)
							# # user_path(@user)
							# # flash[:massage] = "Has Been Updated"
							# else
							# flash[:massage] = "Error Bro"
 						# end
 					end
				end
					def delete
					end

					def destroy
						@user = User.find(params[:id])
						@user.destroy
						redirect_to root_path
				end
			private

			def user_params_edit
				params.require(:user).permit(:first_name, :last_name, :email, :identity, :address, :avatar )
			end
			def user_params
				params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
			end

end

