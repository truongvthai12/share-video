require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:user) { create(:user) }
  let(:valid_youtube_url) {'https://www.youtube.com/watch?v=dc1c8_pX2Q0'}
  let(:invalid_url) {'https://www.example.com'}
  let(:video) { build(:video, user: user, url: valid_youtube_url) }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:url) }

    it 'is valid with a valid YouTube URL' do
      expect(video).to be_valid
    end

    it 'is not valid with an invalid YouTube URL' do
      video.url = invalid_url
      expect(video).not_to be_valid
      expect(video.errors[:url]).to include('not a valid Youtube url')
    end
  end

  describe 'callbacks' do
    it 'calls add_to_home after create' do
      expect(video).to receive(:add_to_home)
      video.save
    end
  end

  describe "#add_to_home" do
    it "broadcasts data to 'video' channel after create" do
      expect(ActionCable.server).to receive(:broadcast).with('video', { layout: video.send(:render_video_layout, video), noti_content: video.send(:noti_content, video) })
      video.save
    end
  end

  describe "#render_video_layout" do
    it "renders the 'home/video' partial with video object" do
      video = build(:video, user: user)
      rendered_partial = video.send(:render_video_layout, video)
      # Check if the rendered_partial contains expected content
      expect(rendered_partial).to include(video.user&.email)
      expect(rendered_partial).to include("<div class=\"row mt-3\">\n  <div class=\"col-sm-8\">")
    end
  end

  describe "#noti_content" do
    it "return correct noti_content" do
      noti_content = "#{user.name} shared #{video.send(:video_title, video.url)}"
      expect(video.send(:noti_content, video)).to eq(noti_content)
    end
  end
end
