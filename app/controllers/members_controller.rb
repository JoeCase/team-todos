class MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params.merge(user: current_user))
    # binding.pry
    if @member.save
      flash[:notice] = "It was saved!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "There was a problem"
      render new_task_path
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      redirect_to member_path
    else
      flash[:notice] = "There was a problem"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def destroy
  end


  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :phone )
  end

end
