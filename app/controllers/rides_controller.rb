class RidesController < ApplicationController

  def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    
    @ride.take_ride

    @message = @ride.message
   

    redirect_to user_path(@ride.user, :message => @message )
    
   
  end

end
