require "rails_helper"

describe Project do
  it { should belong_to :user }
  it { should belong_to :domain }
  it { should validate_presence_of(:url_key) }
  it { should validate_presence_of(:title) }

  it "should validate_uniqueness_of url_key" do
    project = create(:project, url_key: "CAP")
    expect(project).to validate_uniqueness_of(:url_key).scoped_to(:domain_id)
  end

  describe ".build" do
    it "instantiates a photo" do
      project = Project.build
      expect(project.photos.any?).to eq(true)
    end
  end
end
