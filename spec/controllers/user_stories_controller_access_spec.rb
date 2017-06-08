require 'rails_helper'

RSpec.describe UserStoriesController, type: :controller do
  let(:valid_attributes) {
    {number: 'S001', title: 'Create search page', description: "bla bla bla", points: 8}
  }

  let(:invalid_attributes) {
    {title: 'Create search page', description: "bla bla bla", points: 8}
  }
  context "not logged in" do
    describe "GET #index" do
      it "redirects to sign_in" do
        get :index, params: {}
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET #show" do
      it "redirects to sign_in" do
        user_story = UserStory.create! valid_attributes
        get :show, params: {id: user_story.to_param}
          expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #new" do
      it "redirects to sign_in" do
        get :new, params: {}
          expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET #edit" do
      it "redirects to sign_in" do
        user_story = UserStory.create! valid_attributes
        get :edit, params: {id: user_story.to_param}
          expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "doesn't create story" do
          expect {post :create, params: {user_story: valid_attributes}
          }.to change(UserStory, :count).by(0)
        end

          it "redirects to sign_in" do
          post :create, params: {user_story: valid_attributes}
          expect(response).to redirect_to new_user_session_path
        end
      end

    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {number: 'S002', title: 'Create goodbye page', description: "bla bla bla", points: 5}
        }

        it "does not change user_story" do
          user_story = UserStory.create! valid_attributes
          put :update, params: {id: user_story.to_param, user_story: new_attributes}
          user_story.reload
          expect(response).to redirect_to new_user_session_path
          expect(user_story.number).to eq valid_attributes[:number]
        end

        it "redirects to the user_story" do
          user_story = UserStory.create! valid_attributes
          put :update, params: {id: user_story.to_param, user_story: valid_attributes}
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    describe "DELETE #destroy" do
      it "does not destroy the requested user_story" do
        user_story = UserStory.create! valid_attributes
        expect {
          delete :destroy, params: {id: user_story.to_param}
        }.to change(UserStory, :count).by(0)
      end

      it "redirects to the user_stories list" do
        user_story = UserStory.create! valid_attributes
        delete :destroy, params: {id: user_story.to_param}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
