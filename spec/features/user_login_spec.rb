require 'rails_helper'

RSpec.feature "User login", type: :feature do

  let(:user) { create(:user, email: "user@example.com", password: "password") }
  scenario "User login successfully" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    find('div.user_password').fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Welcome #{user.email}")
    expect(current_path).to eq(root_path)
  end

  scenario "User fails to login with invalid password" do
    visit new_user_session_path

    email = user.email
    wrong_password = 'wrongpassword'
    fill_in "Email", with: email
    find('div.user_password').fill_in "Password", with: wrong_password
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password")
  end
end