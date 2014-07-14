class PhotosController < ApplicationController
  def new
    
  end
  
  def create
    project = Project.find(params[:project_id])
    @photo = project.photos.new(photo_params)
    if @photo.save
      flash[:messages] = ["You added a photo to " + project.title + ". Add another?"]
    else
      flash[:errors] = @photo.errors.full_messages
    end
    redirect_to :back
    
  end

  def index
    @photos = Photo.all
  end
  
  private
  def photo_params
    params.require(:photo).permit(:avatar)
  end
end
