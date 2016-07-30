class Support < ActiveRecord::Base

	validates :email, :presence => true
	validates :description, :presence => true
end
