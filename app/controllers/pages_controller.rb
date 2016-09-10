class PagesController < ApplicationController
	
  def home
    @urldetail = Url.all

    if user_signed_in?
      @urlprogressbar = Url.where(user_id: current_user.id).count * 2
      @urluser = Url.where(user_id: current_user.id)
    end

  end

  def about
  	
  end
end
