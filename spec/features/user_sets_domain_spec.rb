require "rails_helper"

feature "User sets domain spec" do
  scenario "authenticated, unused domain" do
    user = create(:user, domain: "www.test.com")
    visit edit_user_path(user, as: user)

    fill_in "Domain", with: "www.new_domain.com"
    click_button "Update User"

    expect(user.reload.domain).to eq("www.new_domain.com")
  end
end
