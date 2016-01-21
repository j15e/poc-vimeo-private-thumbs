require 'rest_client'

class VimeoOembed
  def initialize(video_id)
    @url = "https://vimeo.com/#{video_id}"
    @oembedUrl = "https://vimeo.com/api/oembed.json?url=#{CGI.escape(@url)}"
  end

  def thumbnail
    video['thumbnail_url']
  end

  private

  def video
    @video ||= fetch_video
  end

  def fetch_video
    response = RestClient.get(@oembedUrl)
    video = JSON.parse(response)
  end
end