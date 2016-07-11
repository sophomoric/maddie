require "rails_helper"

feature "User creates root content" do
  scenario "no content on home page" do
    user = create(:user)
    domain = create(:domain, user: user)
    set_host(domain.host)

    visit root_path

    expect(page).to_not have_text("Oh my root")

    visit new_meta_property_list_path(as: user)

    fill_in "Root content", with: "Oh my root"
    click_button "Create"

    visit root_url

    expect(page).to have_text("Oh my root")
  end
end
