module VideoHelper
    def youtube_embed(youtube_url)
      begin
        video = VideoInfo.new(youtube_url)
        url = "https:#{video.embed_url}"
        return url
      rescue StandardError => e
        puts "Error fetching YouTube title: #{e.message}"
        return nil
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