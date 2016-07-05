class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	# def after_sign_out_path_for(resource)
	# about_path
	# end

	#def after_new_registrations_path_for(resource)
	#usersettings_path
	#end

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :name
	    devise_parameter_sanitizer.for(:account_update) << :name
	    devise_parameter_sanitizer.for(:sign_up) << :about
	    devise_parameter_sanitizer.for(:account_update) << :about
	    devise_parameter_sanitizer.for(:sign_up) << :company_name
	    devise_parameter_sanitizer.for(:account_update) << :company_name
	    devise_parameter_sanitizer.for(:sign_up) << :title
	    devise_parameter_sanitizer.for(:account_update) << :title
	    devise_parameter_sanitizer.for(:account_update) << :role
	    devise_parameter_sanitizer.for(:sign_up) << :role
	end
end
