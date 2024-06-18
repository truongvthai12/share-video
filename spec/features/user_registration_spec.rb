require 'rails_helper'

RSpec.feature "User Registration", type: :feature do
  scenario "User registers successfully" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    find('div.user_password').fill_in "Password", with: "password"
    find('div.user_password_confirmation').fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "User fails to register with invalid data" do
    visit new_user_registration_path

    fill_in "Email", with: "invalid_email"
    find('div.user_password').fill_in "Password", with: "short"
    find('div.user_password_confirmation').fill_in "Password confirmation", with: "short"
    click_button "Sign up"

    expect(page).to have_content("is invalid")
    expect(page).to have_content("is too short")
  end
end