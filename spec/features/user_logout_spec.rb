require 'rails_helper'

RSpec.feature "User logout", type: :feature do

  let(:user) { create(:user, email: "user@example.com", password: "password") }
  scenario "User logout successfully" do
    sign_in user
    visit root_path
    click_button('Sign out')
    expect(page).to have_content("Signed out successfully.")
    expect(current_path).to eq("/")
  end

end