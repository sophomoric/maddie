class Api::MediaController < ApplicationController
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
