require 'rails_helper'

describe PagesController do
  before do
    @user = create(:user, domain: "test.host")
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
      post :create, page: build(:page).attributes
      expect(Page.count).to eq(1)
    end

    it "renders the new template on error" do
      sign_in_and_stub(@user)
      page = build(:page)
      page.url_key = nil
      post :create, page: page.attributes

      expect(Page.count).to eq(0)
      expect(response).to render_template(:new)
    end
  end
  describe "Page Update" do
    it "updates a page" do
      sign_in_and_stub(@user)
      page = create(:page, user: @user)
      attributes =  { title: "Beep", body: "Boop" }

      post :update, page: attributes, id: page.id
      expect(Page.first.title).to eq("Beep")
    end

    it "renders edit template if errors are present" do
      sign_in_and_stub(@user)
      page = create(:page, user: @user)
      attributes =  { url_key: nil }

      post :update, page: attributes, id: page.id
      expect(response).to render_template(:edit)
    end
  end

  describe "Page Destroy" do
    it "destroys a page" do
      sign_in_and_stub(@user)
      page = create(:page, user: @user)

      post :destroy, { id: page.id }
      expect(Page.count).to eq(0)
      expect(response).to redirect_to pages_path
    end
  end
end
