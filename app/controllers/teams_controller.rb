class TeamsController < ApplicationController
  def new
  end

  def create
    @markup = Team.new(team_params[:text]).markup
    render :new
  end

  private

  def team_params
    params.require(:team).permit(:text)
  end
end
