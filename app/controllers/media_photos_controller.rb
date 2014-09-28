class MediaPhotosController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create, :new]
      
  def new
    
  end
  
  def create
    medium = Medium.find(params[:medium_id])
    medium.avatar = photo_params[:avatar]
    if medium.save
      flash[:messages] = ["You added a photo for " + medium.name]
    else
      flash[:errors] = @photo.errors.full_messages
    end
    redirect_to :back
  end
  
  def destroy
    
  end
  
  private
  def photo_params
    params.require(:photo).permit(:avatar)
  end
end
