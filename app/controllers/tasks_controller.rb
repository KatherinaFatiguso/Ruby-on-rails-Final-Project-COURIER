class TasksController < ApplicationController
  # before_action :find_task, except: [:new, :index, :create]

  def index
    redirect_to my_tasks_url unless current_user.has_role?(:admin) # Couriers logins will be redirected to my_tasks_url
    @tasks = Task.all # Admin users can see all tasks.
  end

  def my
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
    @couriers = User.with_role(:courier) # a task is assigned to a courier only, never to an admin
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
      :info,
      :sign_required,
      :signed,
      :item_count
    ))

    if @task.save
      create_message("Task created.")
      redirect_to task_url(@task), notice: "Created A Task" #redirect to tasks#show
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @couriers = User.with_role(:courier) # a task is assigned to a courier only, never to an admin
  end

  def update
    @task =  Task.find(params[:id])
      if @task.update_attributes(params.require(:task).permit(
        :user_id,
        :customer_id,
        :sender,
        :from_address,
        :receiver,
        :to_address,
        :status,
        :info,
        :sign_required,
        :signed,
        :item_count
      ))
      create_message("Task Updated.")
      redirect_to task_url(@task), notice: "Task Updated"
    else
      render :edit
    end

  end

  def show
    @task = Task.find(params[:id]).decorate
  end

  def accept_task
    @task = Task.find(params[:id])
    if @task.accept!(current_user.id)
      create_message("Task Accepted.")
      redirect_to task_url(@task), notice: "Task Accepted."
    else
      redirect_to task_url(@task)
    end
  end

  def complete
    @task = Task.find(params[:id])
    if @task.sign_required?
      if !(@task.signed?)
        redirect_to edit_task_url(@task), notice: "Require Client's Signature - Not Signed."
      else
        @task.complete!
        create_message("Task Completed.")
        current_user.update_location!(@task.to_address)
        redirect_to task_url(@task), notice: "Task Completed."
      end
    else
      redirect_to task_url(@task)
    end
  end

  def archive
    @task = Task.find(params[:id])
    if @task.archive!
      create_message("Task Archived.")
      redirect_to task_url(@task), notice: "Task Archived."
    else
      redirect_to task_url(@task)
    end
  end

  private

  def create_message(message)
    @message = Message.create!(user_id: current_user.id, task_id: @task.id, description: message)
  end

  # def find_task
  #   @task = current_user.tasks.find(params[:id]) #find a specific task
  # end

end
