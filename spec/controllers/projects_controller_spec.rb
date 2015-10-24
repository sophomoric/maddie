require "rails_helper"

describe ProjectsController do
  describe 'Post #create' do
    context "unauthenticated" do
      it "does not create a post" do
        user = create(:user)
        post :create, project: { title: "Tiffan", description: "Tot" }
        expect(user.projects.count).to eq(0)
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "error on save" do
      it "renders the new page with an error" do
        user = create(:user)
        sign_in(user)
        user.projects.create(title: "Tiffan", description: "")
        # duplicate post
        post :create, project: { title: "Tiffan", description: "Tot" }
        expect(response).to render_template(:new)
      end
    end

    context "no errors" do
      it "redirects to project page" do
        bilbo = create(:user)
        sign_in(bilbo)

        post :create, project: {
          title: "Tiffan",
          description: "Tot",
          url_key: "tot"
        }

        expect(response).to redirect_to "/projects/#{bilbo.projects.last.url_key}"
      end
    end
  end

  describe "Get #index" do
    it "renders index" do
      create(:user)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #update" do
    it "updates the project" do
      bilbo = create(:user)
      sign_in(bilbo)
      project = create(:project, title: "Dog", user: bilbo)
      changes = { title: "Cat" }

      post :update, project: changes, id: project.url_key

      expect(project.reload.title).to eq("Cat")
      expect(response).to redirect_to(project_path(project))
    end
  end
end
