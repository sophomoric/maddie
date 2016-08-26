require "rails_helper"

feature "Create Pairs" do
  it "creates teams" do
    visit new_team_path

    fill_in "Text", with: "Paige Cara Andy Chai Michael Adrian"

    click_button "Submit"

    expect(page).to have_text("Teams:")
  end
end
