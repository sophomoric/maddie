require "rails_helper"

feature "User views a Project" do
  scenario do
    project = create(:project, url_key: "poo-art")
    visit project_url(project)

    expect(page).to have_text(project.title)
  end
end
