require "rails_helper"

RSpec.describe WelcomeController do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    context "page name exists" do
      it "renders the show page" do
        page = create :page

        get :show, url_key: page.url_key

        expect(response).to render_template(:show)
      end
    end

    context "page url_key does not exist" do
      it "raises a 404" do
        expect do
          get :show, url_key: "not_found"
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

  end
end
