class StaticPagesController < ApplicationController
	# before_action :require_login, only: [:home]

	def home
		@user = User.new
	end
	
end
