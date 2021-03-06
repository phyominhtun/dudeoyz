class UrlsController < ApplicationController
	before_action :set_status, only: [:show, :detailshow, :create]
	before_filter :check, only: [:detailshow]
	before_filter :destroycheck, only: [:destroy]



	def edit
		@url = Url.find_by_random_id(params[:id])
	end

	def show
		ahoy.track_visit
		if url = Url.find_by_random_id(params[:id])
			
			if Visit.where(landing_page: "http://localhost:3000/" + params[:id]).count > 1000
				redirect_to root_path
			elsif url
				redirect_to url.original
			else
				render 'index'
			end

		else
			redirect_to root_path,
			alert: 'Oops! the link you trying to reach is wrong'
		end
	end

	def detailshow
		if 
			@url = Url.new
			letters = [('0'..'9'), ('a'..'z')].map { |i| i.to_a }.flatten
			@url.random_id = (0...6).map{ letters[rand(letters.length)] }.join

			@visit = Url.find_by_random_id(params[:random_id])

			if Rails.env.production?
				@detail = Visit.where(landing_page: "http://www.oyz.kr/" + params[:random_id])
			else
				@detail = Visit.where(landing_page: "http://localhost:3000/" + params[:random_id])
			end
			
			#@d = Visit.where(landing_page: "http://localhost:3000/" + params[:random_id])
			#@detail = Visit.where(landing_page: "http://www.oyz.kr/" + params[:random_id])
			#@detail2 = Visit.where(landing_page: "https://oyz.herokuapp.com/" + params[:random_id])
			#@detail3 = Visit.where(landing_page: "http://oyz.kr/" + params[:random_id])

	    else
	        redirect_to root_path,
	        alert: 'Oops something went wrong'
	    end

	    if @visit.title === nil
	    	@title = "</O>"
	    elsif @visit.title === ""
	    	@title = "</O>"
	    else
	    	@title = @visit.title
	    end
	end

	def urls_params
		params.require(:url).permit(:original, :random_id, :title)
	end

	def create
		@url = Url.new(urls_params)
		if user_signed_in?
			@url.user_id = current_user.id
		else
			@url.user_id = nil
		end

		if @url.save
			redirect_to( 
							(:back), 
							notice: %Q[Your link has been shorten</br>
										#{view_context.link_to("http://www.oyz.kr/#{@url.random_id}", 
											"http://www.oyz.kr/" + (@url.random_id))}</br> 
										#{view_context.link_to("Detail", "http://www.oyz.kr/" + (@url.random_id) + "/+")}.],
    						flash: { html_safe: true }
  						)
		else
			redirect_to (:back), alert: "Oops something went wrong"
		end
	end

	def update
		@url = Url.find(params[:id])
		respond_to do |format|
	      if @url.update(urls_params)
	        format.html { redirect_to detailshow_path(@url.random_id), notice: 'Title was successfully changed.' }
	      else
	        format.html { redirect_to (:back), alert: "Oops something went wrong. Maybe ID you requested was too short or it's already exist" }
	      end
	    end
	end

	def destroy
		@url = Url.find(params[:id])
	    @url.destroy
	    respond_to do |format|
	      format.html { redirect_to (:back) }
	    end
	 end

	private

	# This method for check method & destroycheck method
	def set_status
      @visit = Url.find_by_random_id(params[:random_id])
    end


    # before action for detail page. only create user can see
	def check
		if @visit.user === nil
		elsif current_user != @visit.user
			redirect_to login_path, 
					notice: %Q[
						Sorry this URL is private if you own this URL #{view_context.link_to("Login", login_path)} to see.
						],
					flash: { html_safe: true }
		end
	end

	# before action for destroy, checking user id
	def destroycheck
		@url = Url.find(params[:id])
		if user_signed_in?
			if @url.user === nil
				@url.destroy
				respond_to do |format|
					format.html { redirect_to :back, notice: "URL has been deleted" }
				end
			elsif current_user != @url.user
				redirect_to root_path, notice: "Sorry Something Went Wrong..."
			else
				@url.destroy
				respond_to do |format|
					format.html {redirect_to :back,  notice: "URL has been deleted"}
				end
			end
		else
			redirect_to root_path, notice: "Sorry Something Went Wrong..."
		end
	end
end