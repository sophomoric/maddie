require "rails_helper"

feature "User views a Project" do
  scenario do
    create(:user)
    project = create(:project, url_key: "poo-art")
    visit "/projects/poo-art"
    expect(page).to have_text(project.title)
  end
end
