require "rails_helper"

describe Team do
  it "makes teams of any number" do
    text = "Adrian, Bob, Jack, Doug, Steve, Jill"
    team_size = 3

    team = Team.new(text, team_size)

    expect_number_of_teams(team.markup, 2)
  end

  def expect_number_of_teams(text, number)
    team_count = text.scan(/Team/).count
    expect(team_count).to eq(number)
  end
end
