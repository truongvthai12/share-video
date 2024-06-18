require 'rails_helper'

RSpec.feature "User share video", type: :feature do

  let(:user) { create(:user) }
  scenario "Logged in user share video with valid url successfully" do
    sign_in user
    visit new_video_path

    fill_in "Url", with: Faker::Internet.url
    click_button "Share video"
    expect(page).to have_content("Shared by #{user.email}")
    expect(current_path).to eq(root_path)
  end

  scenario "Logged in user cannot share video with invalid url" do
    sign_in user
    visit new_video_path
    fill_in "Url", with: ""
    click_button "Share video"
    expect(page).to have_content("can't be blank")
    expect(current_path).to eq(create_video_users_path)
  end

  scenario "Guest cannot share video" do
    visit new_video_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(current_path).to eq(new_user_session_path)
  end

end