class SessionsController < ApplicationController

  skip_before_action :logged_in?, only [:new, :create]



  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && user.authenticate(params[:user][:password])
      sessiom[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "Please check your login information and try again"
      redirect_to login_path
  end

  def destroy
    session.clear
    redirect_to "/"
  end


end
