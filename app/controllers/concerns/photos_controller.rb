class PhotosController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create]

  def new
  end

  def crop
    @photo = Photo.find(params[:id])
  end

  def create
    project = Project.find(params[:project_id])
    @photo = project.photos.new(photo_params)
    if @photo.save
      flash[:messages] = ["You added a photo to " + project.title + ". Add another?"]
      render :crop
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to :back
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(cropping_dimensions)
      @photo.reprocess_avatar
      redirect_to :back
    else
      render json: @photo.errors, status: :unprocessable_entity
    end

  end

  def index
    @photos = Photo.all
  end

  private

  def photo_params
    params.require(:photo).permit(:avatar)
  end

  def cropping_dimensions
    params.require(:photo).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end
end
