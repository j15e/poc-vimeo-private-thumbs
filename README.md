> POC to download vimeo thumbnails of private videos

Download all thumbs of private videos trought an album.

    bundle install
    VIMEO_KEY=key VIMEO_ALBUM_ID=id rake

Pretty slow download of thumbs could make use of threads with gem like 'typhoeus'.