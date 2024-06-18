module VideoHelper
    def youtube_embed(youtube_url)
      if youtube_url[/youtu\.be\/([^\?]*)/]
        "https://www.youtube.com/embed/#{$1}"
      elsif youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        "https://www.youtube.com/embed/#{$5}"
      end
    end
  end