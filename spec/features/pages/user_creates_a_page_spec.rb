require "rails_helper"

feature "Creates a Page" do
  scenario "authenticated" do
    user = create(:user)

    visit pages_path(as: user)

    fill_in "Title", with: "About Me"
    fill_in "Url Key", with: "about-me"
    fill_in "Body", with: "I am a philosiphizer"
    click_button "Create Page"

    expect(page).to have_text("Page Saved")
    expect(Page.last.title).to eq("About Me")
  end
end
