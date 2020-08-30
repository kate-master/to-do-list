class ProjectsController < ApplicationController
  before_action :find_project, except: %i[index new create]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params.merge(user_id: current_user.id))
    unless @project.save
      flash.now.alert = @project.errors.full_messages.to_sentence
      render 'shared/errors'
    end
  end

  def update
    unless @project.update(project_params)
      flash.now.alert = @project.errors.full_messages.to_sentence
      render 'shared/errors'
    end
  end

  def destroy
    @project.destroy
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end

# TODO validation, complete, deadline, sort_up - sort down,
