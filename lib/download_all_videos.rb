require 'net/http'

class TooManyRedirects < StandardError; end

class DownloadAllVideos
  def self.download_video(video)
    # save the video locally
    body = self.resolve(video.mp4_url) rescue nil
    if body
      open(Rails.root.join('videos', "#{video.name}.mp4"), "wb") do |file|
        file.write(body)
      end
      video.update_attribute(:downloaded, true)
    end
  end

  def self.resolve(url, redirect_limit = 0)
    raise TooManyRedirects if redirect_limit > 5

    response = Net::HTTP.get_response( URI.parse(url) )

    if response.kind_of?(Net::HTTPRedirection) && !response.response['Location'].nil?
      redirect_limit += 1
      p "resolving #{response.response['Location']}"
      resolve response.response['Location'], redirect_limit
    else
      return response.body
    end
  end

  def self.process
  	videos = Video.not_downloaded
  	p "#{videos.count} videos found to download"

  	videos.each do |video|
  		p "Downloading #{video.name}"
  		download_video(video)
  	end

  	p "Video download complete"
  end
end
