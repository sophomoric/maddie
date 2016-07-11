require "rails_helper"

feature "User creates root content", js: true do
  scenario "no content on home page" do
    clear_host_settings
    user = create(:user)
    create(:domain, user: user, host: "127.0.0.1")

    visit root_path

    expect(page).to_not have_css("h1", text: "Oh my root")

    visit new_meta_property_list_path(as: user)

    fill_in "Root content", with: "<h1>Oh my root<h1>"
    click_button "Create"

    visit root_path

    expect(page).to have_css("h1", text: "Oh my root")
  end

  private

  def clear_host_settings
    default_url_options[:host] = "www.example.com"
    Capybara.app_host = nil
  end
end
