=begin
	This script explains how to push an existing video to an auto push service you have previously configured.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. VIDEO_TOKEN
		4. PUSH_SERVICE_TOKEN

	Example call:
		ruby videos_count.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN PUSH_SERVICE_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];
video_token = ARGV[2]
push_service_token = ARGV[3]

ziggeo = Ziggeo.new(app_token, private_key)

ziggeo.videos.push_to_service(
	video_token,
	"pushservicetoken": push_service_token
)