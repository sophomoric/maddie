class Api::MediaController < ApplicationController
  def create
    @media = Media.new(media_params)
    
    if @media.save
      render json: @media
    end
  end
  
  def destroy
    
  end
end
