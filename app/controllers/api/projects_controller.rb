class Api::ProjectsController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create]
  def create
    @project = Project.new(project_params)
    
    if @project.save
      render "show"
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end
  
  def index
    @projects = Project.joins(:photos)
    render "index"
  end
  
  def show
    @project = Project.find(params[:id])
    @media = @project.media
    @photos = @project.photos
    render "show"
  end
  
  def update
    @project = Project.find(params[:id])
    @media = @project.media
    if @project.update_attributes(params[:project])
      render "show"
    else
      render @project.errors, status: :unprocessable_entity
    end
    
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