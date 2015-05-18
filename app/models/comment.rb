class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	after_create :send_comment_email

#An example of a dictionary or a hash table
#The left is what the users will see. The right is what's stored in DB
	RATINGS = {
		'One Star' => '1_star', 
		'Two Stars' => '2_stars',
		'Three Stars' => '3_stars',
		'Four Stars' => '4_stars',
		'Five Stars' => '5_stars'
 	}

 	def humanized_rating
 		RATINGS.invert[self.rating]
 	end

 	def send_comment_email
 		NotificationMailer.comment_added(self).deliver
 	end

end
