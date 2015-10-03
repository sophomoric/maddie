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

    it "returns the second part of the host" do
      create(:user, domain: "test.host")
      get :index

      expect(response.body).to eq("host")
    end
  end
end
