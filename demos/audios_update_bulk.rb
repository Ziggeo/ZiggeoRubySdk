=begin
	This script shows you how to update more than one audio at once.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. AUDIO_TOKENS

	Example call:
		ruby audios_update_bulk.rb APP_TOKEN PRIVATE_KEY AUDIO_TOKEN1 AUDIO_TOKEN2 ... AUDIO_TOKENn
=end

require_relative "../lib/Ziggeo"

app_token, private_key = ARGV.shift(2)
audio_tokens = ARGV.join(",")

puts "Comma-separated list of tokens/keys: " + "\"" + audio_tokens + "\""

@ziggeo = Ziggeo.new(app_token, private_key)

result = @ziggeo.audios.update_bulk(
	tokens_or_keys: audio_tokens,
	tags: "bulk_updated_with_sdk, ruby"
)

puts result