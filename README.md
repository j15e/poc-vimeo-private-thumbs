# Tasks to downloads thumbs from Vimeo

## Setup

    bundle install

### Get single thumb URL

Get any video thumbnail URL with oEmbed endpoint. **No API key required.**

    rake get_thumbnail[album_id]

### Download all album's thumbs

Download all thumbs of private videos in an album. **API key required.**

    export VIMEO_KEY=key 
    rake list_albums_videos[video_id]

Pretty slow download of thumbs could make use of threads with gem like 'typhoeus'.