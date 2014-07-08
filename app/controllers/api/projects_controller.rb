class ProjectsController < ApplicationController
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
  
  private
  def project_params
    params.require(:project).permit(:title, :body, :avatar)
  end
end