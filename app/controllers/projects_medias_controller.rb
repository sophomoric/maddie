class Api::ProjectsMediasController < ApplicationController
  
  def create
    # find the project by params id, add tags to project.media
    @project = Project.find(params[:id])
    @project.medium_ids = params["media"]
    
    render json: @project.media
  end
  
  def destroy
    
  end
  
end
