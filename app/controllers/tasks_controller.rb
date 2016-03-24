class TasksController < ApplicationController
  def index
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).merge(user: current_user, status: false).permit!)
    # binding.pry
    if @task.save
      flash[:notice] = "It was saved!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "There was a problem"
      render new_task_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
