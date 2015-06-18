class MessagesController < ApplicationController
  before_action :find_task

  def new
    @message = Message.new
  end

  def create
    @message = Message.create!(params.require(:message).permit(:user_id, :task_id, :description))
    @message.user_id = current_user.id
    @message.task_id = @task.id
    if @message.save
      redirect_to user_task_url(current_user, @task), notice: 'Message was created successfully.'
    else
      render :new
    end
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

end
