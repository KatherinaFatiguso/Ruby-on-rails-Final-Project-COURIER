class TasksController < ApplicationController

  def index
    if current_user.has_role? :admin
      @tasks = Task.all
    else
      @tasks = current_user.tasks
    end
  end

end
