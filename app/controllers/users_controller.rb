class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end
	
	def create
    user = User.new(user_params)
    if user.save 
    	session[:user_id] = user.id
    	redirect_to user_path(user)
    else
    	redirect_to new_user_path 
    end
	end

	def show

    @message = params[:message] 
		@user = User.find(params[:id])
		if session[:user_id] == @user.id
      @user = User.find(session[:user_id])
    else
    	redirect_to '/' 
    end
	end


	private

	def user_params
		params.require(:user).permit(:name, :happiness, :nausea, :tickets, :height, :admin, :password, :password_digest)
	end

end
