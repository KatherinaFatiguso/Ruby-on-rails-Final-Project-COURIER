class TasksController < ApplicationController
  # before_action :find_task, except: [:new, :index, :create]

  def index
    if current_user.has_role? :admin
      @tasks = Task.all
    else
      @tasks = current_user.tasks
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(
      :user_id,
      :customer_id,
      :sender,
      :from_address,
      :receiver,
      :to_address,
      :status,
      :urgency,
      :info,
      :sign_required?,
      :signed?,
      :item_count
    ))

    if @task.save
      redirect_to user_task_url(current_user, @task) #redirect to tasks#show
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if Task.find(params[:id])
      redirect_to user_task_url(current_user, @task), notice: "Task Updated."
    else
      render :edit
    end

  end

  def show
    @task = Task.find(params[:id]).decorate
  end

  def accept_task
    @task = Task.find(params[:id])
    @task.accept!
    redirect_to user_task_url(current_user, @task), notice: "Task Accepted."
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete!
    redirect_to user_task_url(current_user, @task), notice: "Task Completed."
  end

  def archive
    @task = Task.find(params[:id])
    @task.archive!
    redirect_to user_task_url(current_user, @task), notice: "Task Archived."
  end

  private

  # def find_task
  #   @task = current_user.tasks.find(params[:id]) #find a specific task
  # end

end
