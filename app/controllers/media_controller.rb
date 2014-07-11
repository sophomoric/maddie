class Api::MediaController < ApplicationController
  def create
    @medium = Media.new(media_params)
    
    if @medium.save
      render json: @medium
    else
      render json: {}, status: :unprocessable_entity
    end
  end
  
  def destroy
    render json: {}
  end
  
  def index
    @media = Medium.all
    render json: @media
  end
  
  def media_params
    params.require(:media).permit(:name, :description)
  end
end
