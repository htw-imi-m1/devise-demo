require 'rails_helper'

RSpec.describe UserStoriesController, type: :controller do
  let(:valid_attributes) {
    {number: 'S001', title: 'Create search page', description: "bla bla bla", points: 8}
  }

  let(:invalid_attributes) {
    {title: 'Create search page', description: "bla bla bla", points: 8}
  }

  # generated tests running with devise login
  context "logged in" do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
    describe "GET #index" do
      it "returns a success response" do
      #  user_story = UserStory.create! valid_attributes
        get :index, params: {}
        expect(response).to be_success
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        user_story = UserStory.create! valid_attributes
        get :show, params: {id: user_story.to_param}
        expect(response).to be_success
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        user_story = UserStory.create! valid_attributes
        get :edit, params: {id: user_story.to_param}
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new UserStory" do
          expect {
            post :create, params: {user_story: valid_attributes}
          }.to change(UserStory, :count).by(1)
        end

        it "redirects to the created user_story" do
          post :create, params: {user_story: valid_attributes}
          expect(response).to redirect_to(UserStory.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {user_story: invalid_attributes}
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {number: 'S002', title: 'Create goodbye page', description: "bla bla bla", points: 5}
        }

        it "updates the requested user_story" do
          user_story = UserStory.create! valid_attributes
          put :update, params: {id: user_story.to_param, user_story: new_attributes}
          user_story.reload
          expect(user_story.number).to eq new_attributes[:number]
        end

        it "redirects to the user_story" do
          user_story = UserStory.create! valid_attributes
          put :update, params: {id: user_story.to_param, user_story: valid_attributes}
          expect(response).to redirect_to(user_story)
        end
      end

      context "with invalid params" do
        it "returns a redirect response (i.e. to display the 'edit' template)" do
          user_story = UserStory.create! valid_attributes
          put :update, params: {id: user_story.to_param, user_story: invalid_attributes}
          expect(response).to be_redirect
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested user_story" do
        user_story = UserStory.create! valid_attributes
        expect {
          delete :destroy, params: {id: user_story.to_param}
        }.to change(UserStory, :count).by(-1)
      end

      it "redirects to the user_stories list" do
        user_story = UserStory.create! valid_attributes
        delete :destroy, params: {id: user_story.to_param}
        expect(response).to redirect_to(user_stories_url)
      end
    end
  end
end
