=begin
  This script shows you how to get data from more than one video at once.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. VIDEO_TOKENS

  Example call:
    ruby videos_get_bulk.rb APP_TOKEN PRIVATE_KEY VIDEO_TOKEN1 VIDEO_TOKEN2 ... VIDEO_TOKENn
=end

require_relative "../lib/Ziggeo"

app_token, private_key = ARGV.shift(2)
video_tokens = ARGV.join(",")

puts "Comma-separated list of tokens/keys: " + "\"" + video_tokens + "\""

@ziggeo = Ziggeo.new(app_token, private_key)

result = @ziggeo.videos.get_bulk(
  tokens_or_keys: video_tokens
)

puts result