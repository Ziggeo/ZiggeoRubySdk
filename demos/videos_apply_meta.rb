=begin
  This script shows you how to apply a meta profile to an existing video.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. VIDEO_TOKEN
    4. META_PROFILE_TOKEN

  Example call:
    ruby videos_apply_meta.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN META_PROFILE_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]
meta_profile_token = ARGV[3]

@ziggeo = Ziggeo.new(app_token, private_key)

result = @ziggeo.videos.apply_meta(
  video_token,
  "metaprofiletoken": meta_profile_token
)

puts result