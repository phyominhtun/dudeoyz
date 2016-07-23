class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	@ip = get_ip

	def get_ip
		res = RestClient.get("http://52.86.18.14")
	  	JSON.parse(res)["52.86.18.14"]
	end
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	devise_parameter_sanitizer.permit(:sign_up, keys: [:about])
	devise_parameter_sanitizer.permit(:account_update, keys: [:about])
	devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name])
	devise_parameter_sanitizer.permit(:account_update, keys: [:company_name])
	devise_parameter_sanitizer.permit(:sign_up, keys: [:title])
	devise_parameter_sanitizer.permit(:account_update, keys: [:title])
	end
end
