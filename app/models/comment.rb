class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

	RATINGS = {
		'*' => '1_star', 
		'**' => '2_stars',
		'***' => '3_stars', 
		'****' => '4_stars',
		'*****' => '5_stars'
	}

	def humanized_rating
    RATINGS.invert[self.rating]
 	end

end
