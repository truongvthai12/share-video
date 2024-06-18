class Video < ApplicationRecord
    belongs_to :user
    validates :url, presence: true
    after_create_commit :add_to_home

    def add_to_home
        ActionCable.server.broadcast 'video', {layout: render_video(self), email:user.email}
    end

    private
    def render_video video
        ApplicationController.renderer.render(partial: "home/video", locals: {video: video})
    end
 
end
  