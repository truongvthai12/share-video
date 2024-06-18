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
        title = video_title(video.url)
       "#{user_name} shared #{title}"
    end

    def video_title url
        video = VideoInfo.new(url)
        video.title
    rescue StandardError => e
        puts "Error fetching YouTube title in video model: #{e.message}"
        return ''
    end
 
end
  