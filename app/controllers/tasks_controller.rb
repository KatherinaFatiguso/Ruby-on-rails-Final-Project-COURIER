class TasksController < ApplicationController
  # before_action :find_task, except: [:new, :index, :create]

  def index
    if current_user.has_role? :admin
      @tasks = Task.all
    else
      @tasks = current_user.tasks
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete!
    redirect_to user_task_url(current_user, @task), notice: "Task Completed."
  end

  def accept_task
    @task = Task.find(params[:id])
    @task.accept!
    redirect_to user_task_url(current_user, @task), notice: "Task Accepted."
  end

  private

  # def find_task
  #   @task = current_user.tasks.find(params[:id]) #find a specific task
  # end

end
