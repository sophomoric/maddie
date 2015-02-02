require "rails_helper"

RSpec.describe ProjectsController do
  describe 'Post #create' do
    context "error creating project" do
      it "renders the new page with an error" do
        Project.create(title: "Tiffan", description: "")
        # duplicate
        post :create, project: { title: "Tiffan", description: "Tot" }
        expect(response).to render_template(:new)
      end
    end

    context "no errors" do
      it "redirects to project page" do

        post :create, project: { title: "Tiffan", description: "Tot" }

        expect(response).to redirect_to "/projects/#{Project.last.id}"
      end
    end
  end
end
