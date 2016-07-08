require "rails_helper"

feature "User creates meta property list" do
  scenario "valid content" do
    user = create(:user)
    domain = create(:domain, user: user)
    set_host(domain.host)
    visit new_meta_property_list_path(as: user)

    fill_in "Og title", with: "Title!"
    fill_in "Og image", with: "http://www.adriancann.com/share_url"
    fill_in "Og url", with: "http://www.adriancann.com/share_url"
    click_button "Create"

    expect(page).to have_text("Success")
  end
end
