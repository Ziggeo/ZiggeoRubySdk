=begin
	This script shows you how to get stats from more than one video at once.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. VIDEO_TOKENS

	Example call:
		ruby videos_stats_bulk.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN1,VIDEO_TOKEN2, ... ,VIDEO_TOKENn
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];
video_tokens = ARGV[2];

ziggeo = Ziggeo.new(app_token, private_key)

puts "Comma-separated list of tokens/keys: " + video_tokens

ziggeo = Ziggeo.new(app_token, private_key)

result = ziggeo.videos.stats_bulk(
	tokens_or_keys: video_tokens,
	summarize: false
)

puts result