require "rails_helper"

feature "Creates a Page" do
  scenario "authenticated" do
    user = user_at_test_domain
    visit root_url(as: user)

    click_link "Edit Menu"
    click_link "New Page"

    unsaved_page = build(:page)
    fill_in_fields(unsaved_page)

    expect(page).to have_text("Page Saved")
    expect(Page.last.title).to eq(unsaved_page.title)
  end

  scenario "reserved url key" do
    user = user_at_test_domain

    visit new_page_url(as: user)
    unsaved_page = build(:page, url_key: Page::RESERVED_WORDS.first)
    fill_in_fields(unsaved_page)

    expect(Page.last).not_to eq(unsaved_page)
    expect(page).to have_text("reserved")
  end

  scenario "hidden page" do
    user = user_at_test_domain

    visit new_page_url(as: user)
    hidden_page = build(:page, hidden: true)
    fill_in_fields(hidden_page)

    expect(Page.last.title).to eq(hidden_page.title)

    visit root_url
    expect(page).not_to have_text(hidden_page.title)
  end

  def fill_in_fields(page)
    fill_in "Title", with: page.title
    fill_in "Url Key", with: page.url_key
    fill_in "Body", with: page.body

    option = page.hidden ? "Yes" : "No"
    select option, from: "page_hidden"

    click_button "Create Page"
  end
end
