require "rails_helper"

feature "Create a list of teams" do
  it "uses all the names" do
    name_text = "Paige Cara Andy Chai Michael Adrian"
    visit new_team_path

    fill_in "team_text", with: name_text

    click_button "Create Teams"

    expect(page).to have_text("Teams:")
    name_text.split(" ").each do |name|
      expect(page).to have_text(name)
    end
  end
end
