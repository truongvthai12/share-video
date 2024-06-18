require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) {{ video:{url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' }}}
  let(:invalid_attributes) { { video:{url: ''} } }

  describe "GET #new_video" do
    context	"when user is signed in" do
        before do
            sign_in user
        end
        it "return a 200 response" do
            get :new_video
            expect(response).to have_http_status "200"
        end

    end
    context	"as	a guest" do
        it "return a 302 response" do
            get :new_video
            expect(response).to have_http_status "302"
        end

        it "redirect to login page" do
            get :new_video
            expect(response).to redirect_to "/users/sign_in"
        end
    end
  end

  describe "POST #create_video" do
    context "when user is signed in with valid attribute" do
      before { sign_in user }

      it "creates a new Video" do
        expect {
          post :create_video, params: valid_attributes
        }.to change(Video, :count).by(1)
      end

      it "redirects to root_path" do
        post :create_video, params: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is signed in with invalid attribute" do
      before { sign_in user }

      it "do not save video" do
        expect {
          post :create_video, params: invalid_attributes
        }.not_to change(Video, :count)
      end

      it "rerender new_video template" do
          post :create_video, params: invalid_attributes
          expect(response).to render_template("new_video")
      end
    end

    context "when user not is sign in" do
      it "creates a new Video" do
          post :create_video, params: valid_attributes
          expect(response).to have_http_status "302"
      end
    end
  end

end