=begin
	This script shows you how to apply an effect profile to an existing video.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. VIDEO_TOKEN
		4. EFFECT_PROFILE_TOKEN

	Example call:
		ruby videos_apply_effect.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN EFFECT_PROFILE_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]
effect_profile_token = ARGV[3]

ziggeo = Ziggeo.new(app_token, private_key)

result = ziggeo.videos.apply_effect(
	video_token,
	"effectprofiletoken": effect_profile_token
)

puts result