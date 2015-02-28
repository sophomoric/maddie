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
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Page create" do
    it "creates a page" do
      sign_in_and_stub(@user)
      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      attributes =  { title: "Tiffan stinks", body: "blah blah blah", order: 1}
      post :create, { page: attributes }
      expect(Page.count).to eq(0)
    end
  end

end
