class SessionsController < ApplicationController
before_action :require_logged_in, only: [:show]
  def new
   @user = User.new
  end
  def create
   @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
   if @user
     session[:user_id] = @user.id
     redirect_to session_path(@user)
   else
     flash[:notice] = "Not a valid username.  Please sign up first!"
     redirect_to new_user_path
   end
  end
  def show
    @user = User.all
  end

  def index
    redirect_to new_session_path
    end


  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
