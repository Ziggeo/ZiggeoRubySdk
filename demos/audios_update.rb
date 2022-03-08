=begin
	This script will show you how to update information from an existing audio.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. AUDIO_TOKEN

	Example call:
		ruby audios_update.rb APP_TOKEN PRIVATE_KEY AUDIO_TOKEN
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
audio_token = ARGV[2]

@ziggeo = Ziggeo.new(app_token, private_key)

result = @ziggeo.audios.update(
	audio_token,
	"tags": "updated_with_sdk, ruby"
)

puts result