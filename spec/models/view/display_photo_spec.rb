describe DisplayPhoto do
  let(:project) { create(:project) }

  describe ".url" do
    describe "empty params" do
      it "finds the project avatar photos medium sized url" do
        params = {}

        image_url = DisplayPhoto.new(project).url(params[:photo_id])
        expect(image_url).to eq(project.avatar.url(:medium))
      end
    end
    describe "params present" do
      it "finds the photos medium image" do
        photo = create(:photo)
        project.photos << photo
        params = { photo_id: photo.id }

        image_url = DisplayPhoto.new(project).url(params[:photo_id])
        expect(image_url).to eq(photo.avatar.url(:medium))
      end
    end
  end
end
