class Api::MediaController < ApplicationController
  def create
    @media = Media.new(media_params)
    
    if @media.save
      render json: @media
    else
      render json: {}, status: :unprocessable_entity
    end
  end
  
  def destroy
    
  end
  
  def media_params
    params.require(:media).permit(:name, :description)
  end
end
