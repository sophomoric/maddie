require 'rails_helper'

describe ApplicationController do
  describe "Page Title" do
    controller do
      def index
        render :text => page_title
      end
    end

    it "compliments me if no user exists" do
      get :index

      expect(response.body).to eq("Adrian Rules")
    end

    it "returns the users title" do
      create(:user, domain: "test.host", page_title: "My Title")
      get :index

      expect(response.body).to eq("My Title")
    end
  end
end
