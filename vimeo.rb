require 'httparty'

class Vimeo
  include HTTParty
  base_uri 'https://api.vimeo.com'

  def initialize(api_key)
    @options = {
      headers: {
        'Authorization' => "bearer #{api_key}"
      }
    }
  end

  def me_albums(id="")
    get("/me/albums/#{id}", 'album')
  end

  def albums_videos(album_id="")
    response = get("/albums/#{album_id}/videos?per_page=50", 'video')
    videos = response['data']

    while response['paging'] && response['paging']['next']
      puts "getting #{response['paging']['next']}"
      response = get(response['paging']['next'], 'video')
      videos += response['data']
    end

    videos
  end

  private

  def get(path, type, options = {})
    options['Accept'] = "Accept: application/vnd.vimeo.#{type};version=3.2"

    JSON.parse(self.class.get(path, @options.merge(options)).body)
  end
end