class TeamsController < ApplicationController
  def new
  end

  def create
    @markup = Team.new(team_params[:text], team_params[:team_size]).markup
    render :new
  end

  private

  def team_params
    params.require(:team).permit(:text, :team_size)
  end
end
