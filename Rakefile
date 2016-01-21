require 'byebug'
require_relative 'lib/vimeo_endpoints'
require_relative 'lib/vimeo_oembed'

desc "Get thumbnail URL for video URL"
task :get_thumbnail, [:video_id] do |t, args|
  puts VimeoOembed.new(args.video_id).thumbnail
end

desc "Download all thumbs for album videos"
task :list_albums_videos, [:album_id] do |t, args|
  vimeo = VimeoEndpoints.new(ENV['VIMEO_KEY'])

  Dir.mkdir('tmp') unless Dir.exist?('tmp')

  Dir.chdir('tmp') do
    videos = vimeo.albums_videos(args.album_id)

    videos.each do |video|
      link = video['pictures']['sizes'].last['link']
      filename = "#{Shellwords.escape(video['name'])}.jpg"
      system('wget', '--no-check-certificate', "-O #{filename}", link)
    end
  end
end