require 'rails_helper'

RSpec.describe HomeController, type: :controller do

    describe "#index" do
		it "responds successfully" do
			get	:index
			expect(response).to	have_http_status(:success)
		end
	end
end