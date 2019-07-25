=begin
  This script shows you how to get stats from a single video.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. VIDEO_TOKEN

  Example call:
    ruby videos_get_stats.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN
=end

require 'json'
require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]

@ziggeo = Ziggeo.new(app_token, private_key)
video_data = @ziggeo.videos.get_stats(video_token)

puts JSON.pretty_generate(video_data)