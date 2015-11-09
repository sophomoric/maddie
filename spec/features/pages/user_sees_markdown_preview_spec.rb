require "rails_helper"

feature "Makrdown Preview", js: true do
  scenario do
    clear_host_settings
    user = create(:user)
    create(:domain, user: user, host: "127.0.0.1")

    visit new_page_path(as: user)

    fill_in "Body", with: "<a href='http://www.google.com'>google</a>"

    expect(page).to have_link("google")
  end

  def clear_host_settings
    default_url_options[:host] = "www.example.com"
    Capybara.app_host = nil
  end
end
