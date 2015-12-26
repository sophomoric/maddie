require "rails_helper"

feature "Edits a Page" do
  scenario "unauthenticated" do
    visit pages_path

    expect(page).to have_text("Sign in")
  end

  scenario "authenticated as a user under different domain" do
    page_owner = create(:user)
    create(:domain, user: page_owner, host: "wrong_domain_for_test")
    set_host("different")
    create(:page, user: page_owner)
    my_page = create(:page, user: page_owner)

    visit edit_page_path(my_page, as: page_owner)

    expect(page).to have_text("You do not have permission to edit that!")
  end

  scenario "authenticated user at correct domain" do
    user = user_at_test_domain
    nice_page = create(:page, user: user)

    visit edit_page_path(nice_page, as: user)

    expect(page).to have_text(nice_page.body)
    expect(page).to have_button("Update Page")
  end
end
