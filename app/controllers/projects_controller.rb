class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :ensure_domain_has_user!

  def new
    @project = Project.build
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:messages] = ["Project Saved"]
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      render "new"
    end
  end

  def show
    @project = user_by_domain.projects.find_by_url_key!(params[:url_key])
  end

  def edit
    @project = current_user.projects.find_by_url_key!(params[:id])
  end

  def update
    @project = current_user.projects.find_by_url_key(params[:id])

    if @project.update(project_params)
      flash[:messages] = ["Project Updated"]
      redirect_to project_url(@project)
    else
      flash[:errors] = @project.errors.full_messages
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
