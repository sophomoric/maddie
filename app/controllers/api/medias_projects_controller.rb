class Api::MediasProjectsController < ApplicationController
  def create
    @project = Project.find(params[:id])
    @project.medium_ids = params([:medium_ids])
    render json: @project
  end
end
