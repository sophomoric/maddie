require 'rails_helper'

describe ApplicationController do
  include AuthHelper
  let(:current_host) { "test.host" }

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
      create(:domain, host: current_host, page_title: "My Title")
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

    it "finds the user assoicated with the current_host" do
      user = create(:user)
      create(:domain, user: user, host: current_host)

      get :index

      expect(response.body).to eq(user.email)
    end
  end

  describe ".current_user_domain" do
    controller do
      def index
        render text: current_user_domain.try(:host)
      end
    end

    it "returns nil if current_user is nil" do
      stub_current_user(nil)

      get :index

      expect(response.body).to eq("")
    end

    it "returns nil if current_user does not own the domain" do
      bob = create(:user)
      steve = create(:user)
      create(:domain, host: current_host, user: steve)
      stub_current_user(bob)

      get :index

      expect(response.body).to eq("")
    end

    it "returns the current_user's domain" do
      user = create(:user)
      domain = create(:domain, user: user, host: current_host)
      stub_current_user(user)

      get :index

      expect(response.body).to eq(domain.host)
    end
  end
end
