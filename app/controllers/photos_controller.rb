class PhotosController < ApplicationController
  def new
    
  end
  
  def create
    project = Project.find(params[:project_id])
    photo = project.photos.new(photo_params)
    photo.save
    redirect_to photos_url
  end

  def index
    @photos = Photo.all
  end
  
  private
  def photo_params
    params.require(:photo).permit(:avatar)
  end
end
