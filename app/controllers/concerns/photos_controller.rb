class PhotosController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create]

  def new
    @project = Project.find(params[:project_id])
  end

  def crop
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to :back
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to :back
    end
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update(cropping_dimensions)
      photo.reprocess_avatar
      flash[:messages] = ["You added a photo to #{photo.project.title}. Add another?"]
      redirect_to new_project_photo_url(photo.project)
    else
      flash[:messages] = [photo.errors]
      render :crop
    end

  end

  def index
    @photos = Photo.all
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to edit_project_url(@photo.project)
  end

  private

  def photo_params
    params.require(:photo).permit(:avatar, :project_id)
  end

  def cropping_dimensions
    params.require(:photo).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end
end
