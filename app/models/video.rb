class Video < ApplicationRecord
    belongs_to :user
    validates :url, presence: true
    after_create_commit :add_to_home

    def add_to_home
        ActionCable.server.broadcast 'video', message: "message.content", user:"message.user.name"
    end
 
end
  