=begin
  This script will show you how to update information from an existing video.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. VIDEO_TOKEN

  Example call:
    ruby videos_update.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]

@ziggeo = Ziggeo.new(app_token, private_key)

result = @ziggeo.videos.update(
  video_token,
  "tags": "updated_with_sdk, ruby"
)

puts result