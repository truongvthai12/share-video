module VideoHelper
    def youtube_embed(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        "https://www.youtube.com/embed/#{$1}"
      elsif youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        "https://www.youtube.com/embed/#{$5}"
      end
    end

    def fetch_youtube_title(url)
      begin
        video = VideoInfo.new(url)
        title = video.title
        return title
      rescue StandardError => e
        puts "Error fetching YouTube title: #{e.message}"
        return nil
      end
    end
  end