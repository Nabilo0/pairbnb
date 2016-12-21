class UsersController < ApplicationController
	
	def index
		@user = User.all
	end

	def new 
		@user = User.new
		render :"index.html/new"
	end

	def create
	@user = User.new
	end

end
