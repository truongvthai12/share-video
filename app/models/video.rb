class Video < ApplicationRecord
    belongs_to :user
    validates :url, presence: true
    after_create_commit :add_to_home

    validate :check_valid_url

    def add_to_home
        ActionCable.server.broadcast 'video', {layout: render_video_layout(self), noti_content: noti_content(self)}
    end

    def check_valid_url
        unless is_valid_url?
            errors.add(:url, "not a valid Youtube url")
        end
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
    end

    def is_valid_url?
        VideoInfo.new(url)
        true
    rescue StandardError => e
        puts "Error fetching YouTube title in method is_valid_url?: #{e.message}"
        return false
    end
 
end
  