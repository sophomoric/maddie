require "rails_helper"

feature "Edits a Page" do
  scenario "unauthenticated" do
    visit pages_path

    expect(page).to have_text("Sign in")
  end

  scenario "authenticated as a user under different domain" do
    user = create(:user)
    domain = create(:domain, user: create(:user), host: "host")

    set_host("host")
    a_page = create(:page, domain: domain)

    visit edit_page_path(a_page, as: user)

    expect(page).to have_text("You do not have permission to edit that!")
  end

  scenario "authenticated user at correct domain" do
    domain_owner = create(:user)
    domain = create(:domain, user: domain_owner, host: "host")
    set_host("host")
    a_page = create(:page, domain: domain)

    visit edit_page_path(a_page, as: domain_owner)

    expect(page).to have_text(a_page.body)
    expect(page).to have_button("Update Page")
  end
end
