class VideoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "video"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
