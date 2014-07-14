class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_to projects_url
    else
      
      redirect_to :back
    end
  end
  
  def index
    @projects = Project.all
    render :index
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :description, :year, :height, :width, :avatar)
  end
end
