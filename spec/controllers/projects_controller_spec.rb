require "rails_helper"

describe ProjectsController do
  let!(:user) { create(:user) }
  let!(:domain) { create(:domain, user: user, host: "test.host") }

  describe 'Post #create' do
    context "unauthenticated" do
      it "does not create a post" do
        post :create, project: { title: "Tiffan", description: "Tot" }

        expect(user.projects.count).to eq(0)
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "error on save" do
      it "renders the new page with an error" do
        sign_in(user)
        user.projects.create(title: "Tiffan", description: "")
        # duplicate post
        post :create, project: { title: "Tiffan", description: "Tot" }

        expect(response).to render_template(:new)
      end
    end

    context "no errors" do
      it "redirects to project page" do
        sign_in(user)

        post :create, project: {
          title: "Tiffan",
          description: "Tot",
          url_key: "tot"
        }

        expect(response).to redirect_to "/projects/#{user.projects.last.url_key}"
      end
    end
  end

  describe "Get #index" do
    it "renders index" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe "POST #update" do
    it "updates the project" do
      sign_in(user)
      project = create(:project, title: "Dog", user: user)
      changes = { title: "Cat" }

      post :update, project: changes, id: project.url_key

      expect(project.reload.title).to eq("Cat")
      expect(response).to redirect_to(project_path(project))
    end
  end
end
