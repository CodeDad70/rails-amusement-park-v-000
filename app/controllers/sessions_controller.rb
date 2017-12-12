class SessionsController < ApplicationController
  

  def new
  end
  
  def create
    if params[:user][:name] == ""
      redirect_to new_user_path
    else
    @user = User.find_by(name:params[:user][:name])
  
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end




end