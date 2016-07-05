class AdminController < ApplicationController
	before_action :authenticate_user!

	def index
		@admin_user === User.where(email: "dawoodmehta@gmail.com")
		if current_user === @admin_user
			@visit = Visit.all
			@visitcount = Visit.count
		else
			redirect_to root_path, notice: "sorry"
		end
	end
end
