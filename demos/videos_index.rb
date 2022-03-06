=begin
	This script shows you how to list all videos from your application.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY

	Example call:
		ruby videos_index.rb APP_TOKEN PRIVATE_KEY
		ruby videos_index.rb APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]

ziggeo = Ziggeo.new(app_token, private_key)

videos = []
skip = 0
limit = 100

loop do
	videos = ziggeo.videos.index(
		"skip": skip,
		"limit": limit
	)

	videos.each {
		|video| puts "Listing " + video["token"]
		skip += 1
	}

	break if videos.length == 0
end