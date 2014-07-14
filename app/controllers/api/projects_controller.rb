class Api::ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    
    if @project.save
      render "show"
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  
  def index
    @projects = Project.all.includes(:media)
    render "index"
  end
  
  def show
    @project = Project.find(params[:id])
    render "show"
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render json: {}
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :description, :year, :height, :width, :avatar)
  end
end