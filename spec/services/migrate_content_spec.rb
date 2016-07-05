require "rails_helper"

describe MigrateContent do
  describe ".run" do
    it "associates models with a users first domain" do
      user = create(:user)
      domain = create(:domain, user: user)
      page = create(:page, user: user)
      project = create(:project, user: user)
      photo = create(:photo, project: project)

      MigrateContent.run
      page.reload
      photo.reload
      project.reload

      expect(page.domain).to eq(domain)
      expect(project.domain).to eq(domain)
      expect(photo.domain).to eq(domain)
    end
  end
end
