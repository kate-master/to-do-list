class TasksController < ApplicationController
  before_action :find_task, except: %i[new create]

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def edit; end

  def create
    @task = Task.new(tasks_params.merge({ project_id: params[:project_id] }))
    unless @task.save
      flash.now.alert = @task.errors.full_messages.to_sentence
      render 'shared/errors'
    end
  end

  def update
    if params[:move_higher] == "true"
      @task.move_higher
    elsif params[:move_lower] == "true"
      @task.move_lower
    else
      unless @task.update(tasks_params)
        flash.now.alert = @task.errors.full_messages.to_sentence
        render 'shared/errors'
      end
    end
  end

  def destroy
    @task.destroy
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:text, :complete, :deadline)
  end
end
