require "rails_helper"

describe Project do
  it { should belong_to :user }

  describe ".build" do
    it "instantiates a photo" do
      project = Project.build
      expect(project.photos.any?).to eq(true)
    end
  end
end
