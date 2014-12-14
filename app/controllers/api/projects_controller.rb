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

  def crop
    @project = Project.find(params[:id])

    # binding.pry
  end

  def index
    @projects = Project.all.includes(:photos)
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
    update_avatar

    if @project.update_attributes(params[:project])

      render json: @project
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

  def cropping_dimensions
    params.require(:photo).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end

  def update_avatar
    return unless params[:avatar]

    @project.avatar = params[:avatar]
    @project.save
    @project.photo_url = @project.avatar.url(:medium)
  end
end