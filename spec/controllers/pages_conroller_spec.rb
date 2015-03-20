require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  def sign_in_and_stub(user)
    sign_in :user, user
    allow(controller).to receive(:current_user) { user }
  end

  before do
    @user = create(:user)
  end

  describe "GET index" do
    it "returns http success" do
      sign_in_and_stub(@user)

      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Page create" do
    it "creates a page" do
      sign_in_and_stub(@user)
      attributes = {
        title: "Tiffan stinks",
        body: "blah blah blah",
        order: 1,
        url_key: "stinker"
      }
      post :create, { page: attributes }
      expect(Page.count).to eq(1)
    end
  end
  describe "Page Update" do
    it "updates a page" do
      sign_in_and_stub(@user)
      page = create(:page)
      attributes =  { title: "Beep", body: "Boop" }

      post :update, { page: attributes, id: page.id }
      expect(Page.count).to eq(1)
      expect(Page.first.title).to eq("Beep")
    end
  end

  describe "Page Destroy" do
    it "destroys a page" do
      sign_in_and_stub(@user)
      page = create(:page)
      request.env["HTTP_REFERER"] = pages_url

      post :destroy, { id: page.id }
      expect(Page.count).to eq(0)
    end
  end
end
