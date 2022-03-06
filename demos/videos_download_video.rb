=begin
	This script shows you how to download a single video.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. VIDEO_TOKEN
		4. FILE_NAME

	Example call:
		ruby videos_download_video.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
video_token = ARGV[2]
file_name = ARGV[3]

ziggeo = Ziggeo.new(app_token, private_key)

# Download video
video_blob = ziggeo.videos.download_video(video_token)

# Save video to file
File.open(file_name, "w") {
	|file|
	file.print video_blob
}