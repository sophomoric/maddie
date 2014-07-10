class Api::ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    
    if @project.save
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  
  def index
    @projects = Project.all
    render :json => @projects
  end
  
  def show
    @project = Project.find(params[:id])
    render :json => @project
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render json: {}
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :body, :date, :avatar, :tags)
  end
end