class ProjectsController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create, :update]

  def new
    @project = Project.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render "edit"
    end
  end

  def index
    @projects = Project.all.includes(:photos)
  end

  private

  def project_params
    params.require(:project).
     permit(:title, :description, :avatar, photos_attributes: [:avatar])
  end
end
