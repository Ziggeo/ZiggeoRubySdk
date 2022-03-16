=begin
	This script shows you how to upload a video.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. FILE

	Example call:
		ruby videos_create.rb APP_TOKEN PRIVATE_KEY FILE
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];
filename = ARGV[2];

ziggeo = Ziggeo.new(app_token, private_key)

puts ziggeo.videos.create(nil, filename)