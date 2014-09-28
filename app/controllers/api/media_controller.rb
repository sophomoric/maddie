class Api::MediaController < ApplicationController
  before_filter :authenticate_user!,
      :only => [:destroy, :create]
  def create
    @medium = Medium.new(media_params)
    
    if @medium.save
      render "show"
    else
      render json: {}, status: :unprocessable_entity
    end
  end
  
  def show
    @medium = Medium.find(params[:id])
    @projects = @medium.projects
    render "show"
  end
  
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy
    render json: {}
  end
  
  def index
    @media = Medium.all
    render "index"
  end
  
  def media_params
    params.require(:medium).permit(:name, :description, :avatar)
  end
end
