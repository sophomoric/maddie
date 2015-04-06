describe View::DisplayPhoto do
  let(:project) { create(:project) }

  describe ".main_photo" do
    describe "empty params" do
      it "finds the project avatar photos medium sized url" do
        params = {}
        image_url = View::DisplayPhoto.new(project, params).main_photo
        expect(image_url).to eq(project.avatar.url(:medium))
      end
    end
    describe "params present" do
      it "finds the photos medium image" do
        photo = create(:photo)
        project.photos << photo
        params = { photo_id: photo.id }

        image_url = View::DisplayPhoto.new(project, params).main_photo
        expect(image_url).to eq(photo.avatar.url(:medium))
      end
    end
    describe "no cover photo" do
      it "uses the first photo of the project" do
        photo = create(:photo)
        # stub_project_avatar(project, "picture_url")
        project.photos = [photo]
        params = {}

        image_url = View::DisplayPhoto.new(project, params).main_photo

        expect(image_url).to eq(photo.avatar.url(:medium))
      end
    end
  end

  describe ".photo_url" do
    it "is the project url with the photo id in the params" do
      project = create(:project)
      photo = create(:photo)
      params = {}

      image_url = View::DisplayPhoto.new(project, params).photo_url(photo)
      expect(image_url.include?("photo_id=#{photo.id}")).to eq(true)
    end
  end
end
