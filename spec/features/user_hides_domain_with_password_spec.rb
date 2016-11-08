require "rails_helper"

feature "User hides domain with password" do
  scenario "not presently hidden" do
    user = create(:user)
    domain = create(:domain, user: user)
    create(:meta_property_list, domain: domain, password_protected: false)
    set_host(domain.host)

    visit new_meta_property_list_path(as: user)

    select "Yes", from: "Password protected"

    click_button "Update"

    expect(page).to have_text("Success")

    click_link "logout"

    visit root_url
    expect(page).to have_text("Sign in")
  end
end
