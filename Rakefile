require 'byebug'
require './vimeo'

task :default do
  vimeo = Vimeo.new(ENV['VIMEO_KEY'])

  Dir.mkdir('tmp') unless Dir.exist?('tmp')

  Dir.chdir('tmp') do
    videos = vimeo.albums_videos(ENV['VIMEO_ALBUM_ID'])

    videos.each do |video|
      link = video['pictures']['sizes'].last['link']
      filename = "#{Shellwords.escape(video['name'])}.jpg"
      system('wget', '--no-check-certificate', "-O #{filename}", link)
    end
  end
end