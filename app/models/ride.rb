class Ride < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :attraction

 

	def take_ride
		if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
			@message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
			message
		elsif self.user.tickets < self.attraction.tickets
			@message = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
			message
		elsif self.user.height < self.attraction.min_height
			@message = "Sorry. You are not tall enough to ride the #{attraction.name}."
			message
		else 
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
		 	self.user.happiness += self.attraction.happiness_rating
		 	@message = "Thanks for riding the #{self.attraction.name}!"
		 	message
			self.user.save
			
		end
	end


	def message
		@message
	end

end
