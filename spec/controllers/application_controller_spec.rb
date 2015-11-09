require 'rails_helper'

describe ApplicationController do
  let(:current_domain) { "test.host" }

  describe ".page_title" do
    controller do
      def index
        render :text => page_title
      end
    end

    it "compliments me if no user exists" do
      get :index

      expect(response.body).to eq("Adrian Rules")
    end

    it "returns the domains page title" do
      create(:domain, host: current_domain, page_title: "My Title")
      get :index

      expect(response.body).to eq("My Title")
    end
  end

  describe ".user_by_domain" do
    controller do
      def index
        render text: user_by_domain.email
      end
    end

    it "finds the user assoicated with the current_domain" do
      user = create(:user)
      create(:domain, user: user, host: current_domain)

      get :index

      expect(response.body).to eq(user.email)
    end
  end
end
