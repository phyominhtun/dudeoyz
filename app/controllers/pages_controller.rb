class PagesController < ApplicationController
	
  def home
    @url = Url.new
    letters = [(0..9), ('a'..'z')].map { |i| i.to_a }.flatten
    @url.random_id = (0...6).map{ letters[rand(letters.length)] }.join

    @urldetail = Url.all

    if user_signed_in?
      @urlprogressbar = Url.where(user_id: current_user.id).count * 2
      @urluser = Url.where(user_id: current_user.id)
    end

  end

  def about
  	
  end
end
