class Url < ActiveRecord::Base
	validates :original, :presence => true
	belongs_to :user

	validates	:random_id, 
				:presence => true,
				length: {
                    minimum: 6,
                    maximum: 15,
                    too_short: "must have at least %{count} letters",
                    too_long: "sorry not more than %{count} letters"
            	}
end
