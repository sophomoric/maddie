class ProjectsController < ApplicationController
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

    if @project.save
      redirect_to @project
    else
      render "edit"
    end
  end

  private

  def project_params
    params.require(:project).
     permit(:title, :description, :avatar, photos_attributes: [:avatar])
  end
end
