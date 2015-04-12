require 'rails_helper'

describe PhotosController do
  def set_http_referrer
    request.env["HTTP_REFERER"] = "www.some_project.url"
  end

  before do
    user = create(:user)
    sign_in_and_stub(user)
  end

  describe "POST create" do
    it "Adds a photo" do
      set_http_referrer
      project = create(:project)
      photo = build(:photo, project_id: project.id)

      post :create, photo: photo.attributes
      expect(project.photos.count).to eq(1)
    end
  end

  describe "POST delete" do
    it "destroys a photo" do
      project = create(:project)
      photo = create(:photo)
      project.photos << photo

      post :destroy, { id: photo.id }
      expect(Photo.count).to eq(0)
      expect(response).to redirect_to(edit_project_path(photo.project))
    end
  end
end
