class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def new
    @project = Project.build
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to @project
    else
      render "new"
    end
  end

  def show
    @project = user_by_domain.projects.find_by_url_key(params[:url_key])
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update(project_params)
      redirect_to edit_project_url(@project)
    else
      render "edit"
    end
  end

  def index
    @projects = user_by_domain.projects.includes(:photos)
  end

  private

  def project_params
    params.require(:project).
     permit(
       :title,
       :description,
       :avatar,
       :url_key,
       photos_attributes: [:avatar]
    )
  end
end
