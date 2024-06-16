class UsersController < ApplicationController
    def new_video
        @video = Video.new
        
    end

    def create_video
        @video = Video.new(video_params)
        @video.user_id = current_user.id
        if @video.save
            redirect_to root_path
        else

        end
    end

    private

    def video_params
        params.require(:video).permit(:url)
    end
  
end
