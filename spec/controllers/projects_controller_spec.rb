require "rails_helper"

describe ProjectsController do
  def sign_in_bilbo
    user = User.create(email: "bilbo@baggins.com", password: "MyHobbitHole")
    sign_in :user, user
  end

  describe 'Post #create' do
    context "unauthenticated" do
      it "does not create a post" do
        post :create, project: { title: "Tiffan", description: "Tot" }
        expect(Project.count).to eq(0)
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "error on save" do
      it "renders the new page with an error" do
        sign_in_bilbo
        Project.create(title: "Tiffan", description: "")
        # duplicate post
        post :create, project: { title: "Tiffan", description: "Tot" }
        expect(response).to render_template(:new)
      end
    end

    context "no errors" do
      it "redirects to project page" do
        sign_in_bilbo

        post :create, project: { title: "Tiffan", description: "Tot" }

        expect(response).to redirect_to "/projects/#{Project.last.id}"
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
      sign_in_bilbo
      project = create(:project, title: "Dog")
      changes = { title: "Cat" }

      post :update, project: changes, id: project.id

      expect(project.reload.title).to eq("Cat")
      expect(response).to redirect_to(edit_project_path(project))
    end
  end
end
