require "rails_helper"

feature "User sets domain spec" do
  scenario "authenticated, unused domain" do
    user = create(:user)
    domain = create(:domain, user: user, host: "www.test.com")
    visit edit_user_path(user, as: user)

    set_field("user_domains_attributes_0_host", "www.new_domain.com")
    click_button "Update User"

    expect(domain.reload.host).to eq("www.new_domain.com")
  end

  scenario "Domain Already in Use" do
    user = create(:user)
    create(:domain, host: "www.squat.com")
    visit edit_user_path(user, as: user)

    set_field("user_domains_attributes_0_host", "www.squat.com")
    click_button "Update User"

    expect(user.domains.pluck(:host)).to_not include("www.squat.com")
  end

  def set_field(id, value)
    find_by_id(id).set(value)
  end
end
