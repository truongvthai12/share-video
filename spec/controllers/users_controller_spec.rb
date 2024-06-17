require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' } }
  let(:invalid_attributes) { { url: '' } }

 

  describe "GET #new_video" do
    context	"as	an authenticated user" do
        before do
            sign_in user  # Assuming you're using Devise for authentication
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

  
end