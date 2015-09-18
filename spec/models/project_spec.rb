require "rails_helper"

describe Project do
  it { should belong_to :user }
  it { should validate_uniqueness_of(:url_key) }
  it { should validate_presence_of(:url_key) }
  it { should validate_presence_of(:title) }

  describe ".build" do
    it "instantiates a photo" do
      project = Project.build
      expect(project.photos.any?).to eq(true)
    end
  end
end
