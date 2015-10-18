require "rails_helper"

feature "Makrdown Preview", js: true do
  scenario do
    user = create(:user, domain: "127.0.0.1")

    visit new_page_path(as: user)

    fill_in "Body", with: "<a href='http://www.google.com'>google</a>"

    expect(page).to have_link("google")
  end
end
