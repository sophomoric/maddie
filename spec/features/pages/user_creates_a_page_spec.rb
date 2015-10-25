require "rails_helper"

feature "Creates a Page" do
  scenario "authenticated" do
    user = create(:user)
    set_host(user.domain)
    visit root_url(as: user)

    click_link "Edit Menu"
    click_link "New Page"

    unsaved_page = build(:page)
    fill_in_fields(unsaved_page)

    expect(page).to have_text("Page Saved")
    expect(Page.last.title).to eq(unsaved_page.title)
  end

  scenario "reserved url key" do
    user = create(:user)
    set_host(user.domain)

    visit new_page_url(as: user)
    unsaved_page = build(:page, url_key: Page::RESERVED_WORDS.first)
    fill_in_fields(unsaved_page)

    expect(Page.last).not_to eq(unsaved_page)
    expect(page).to have_text("reserved")
  end

  def fill_in_fields(page)
    fill_in "Title", with: page.title
    fill_in "Url Key", with: page.url_key
    fill_in "Body", with: page.body
    click_button "Create Page"
  end
end
