require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:user) { create(:user) }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:url) }
  end

  describe "callbacks" do
    it "broadcasts video to 'video' channel after create" do
      video = build(:video, user: user)
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
      expect(rendered_partial).to include("<iframe width=\"490\" height=\"275\"")
    end
  end
end
