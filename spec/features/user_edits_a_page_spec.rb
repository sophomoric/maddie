require "rails_helper"

feature "Edits a Page" do
  scenario "unauthenticated" do
    visit pages_path

    expect(page).to have_text("Sign in")
  end

  scenario "authenticated as a user under different domain" do
    page_owner = create(:user)
    create(:page, user: page_owner)
    page_owner.update_attribute(:domain, "wrong_domain_for_test")

    visit pages_path(as: page_owner)

    expect(page).to have_text("You do not have permission to edit that!")
  end

  scenario "authenticated user at correct domain" do
    user = create(:user)
    nice_page = create(:page, user: user)

    visit pages_path(as: user)

    expect(page).to have_text(nice_page.body)
    expect(page).to have_button("Update Page")
  end
end
