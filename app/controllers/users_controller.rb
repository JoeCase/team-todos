class UsersController < ApplicationController

  skip_before_action :logged_in?, only: [:new, :create]

  def index
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit!)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:notice] = "There was a problem with your informatoin, please try again"
      render new_user_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
