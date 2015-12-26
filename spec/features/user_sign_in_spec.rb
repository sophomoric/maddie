require "rails_helper"

feature "Sign in" do
  scenario "User at correct domain" do
    user = create(:user)
    domain = create(:domain, user: user)
    set_host(domain.host)
    sign_in(user)

    expect(page).to have_text("Signed in successfully")
  end

  scenario "User with no domain registered yet" do
    user = create(:user, domains: [])
    set_host("something")
    sign_in(user)

    expect(page).to have_text("Signed in successfully")
  end

  scenario "Email not registered" do
    user = user_at_test_domain
    user.password = "not correct"

    sign_in(user)

    expect(page).to have_text("Invalid email")
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
