class AdminController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.email === "dawoodmehta@gmail.com"
			@visit = Visit.all
			@url = Url.all
			@user = User.all
			@support = Support.all
		else
			redirect_to root_path, notice: "sorry"
		end
	end

	def url
		if current_user.email === "dawoodmehta@gmail.com"
			@visit = Visit.all
			@url = Url.all
			@user = User.all
			@support = Support.all
		else
			redirect_to root_path, notice: "sorry"
		end
	end

	def user
		if current_user.email === "dawoodmehta@gmail.com"
			@visit = Visit.all
			@url = Url.all
			@user = User.all
			@support = Support.all
		else
			redirect_to root_path, notice: "sorry"
		end
	end

	def visit
		if current_user.email === "dawoodmehta@gmail.com"
			@visit = Visit.all
			@url = Url.all
			@user = User.all
			@support = Support.all
		else
			redirect_to root_path, notice: "sorry"
		end
	end

	def support
		if current_user.email === "dawoodmehta@gmail.com"
			@visit = Visit.all
			@url = Url.all
			@user = User.all
			@support = Support.all
		else
			redirect_to root_path, notice: "sorry"
		end
	end
end
