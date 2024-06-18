class Video < ApplicationRecord
    belongs_to :user
    validates :url, presence: true
    after_create_commit :add_to_home

    def add_to_home
        ActionCable.server.broadcast 'video', {layout: render_video_layout(self), noti_content: noti_content(self)}
    end

    private
    def render_video_layout video
        ApplicationController.renderer.render(partial: "home/video", locals: {video: video})
    end
    def noti_content video
        user_name = video.user&.name
        title = VideoInfo.new(video.url)&.title
       "#{user_name} shared #{title}"
    end
 
end
  