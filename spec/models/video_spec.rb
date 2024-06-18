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
    it "calls add_to_home after create" do
      video = build(:video, user: user)
      expect(video).to receive(:add_to_home)
      video.save
    end
  end

  describe "#add_to_home" do
    it "broadcasts to the 'video' channel" do
      video = create(:video, user: user)

      expect(ActionCable.server).to receive(:broadcast).with(
        'video',
        {url: helper.youtube_embed(url), email:user.email}
      )

      video.add_to_home
    end
  end
end
