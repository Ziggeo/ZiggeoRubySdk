=begin
  This script shows you how to download a video's covershot.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. VIDEO_TOKEN

  Example call:
    ruby videos_download_image.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]
file_name = ARGV[3]

@ziggeo = Ziggeo.new(app_token, private_key)

covershot_blob = @ziggeo.videos.download_image(video_token)

File.open("covershot.jpeg", "w") {
  |file|
  file.print covershot_blob
}