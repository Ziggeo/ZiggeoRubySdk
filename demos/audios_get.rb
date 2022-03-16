=begin
	This script shows you how to get data from a single audio.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. AUDIO_TOKEN

	Example call:
		ruby videos_get.rb APP_TOKEN PRIVATE_KEY AUDIO_TOKEN
=end

require 'json'
require_relative "../lib/Ziggeo"

app_token = ARGV[0]
private_key = ARGV[1]
audio_token = ARGV[2]

@ziggeo = Ziggeo.new(app_token, private_key)
audio_data = @ziggeo.audios.get(audio_token)

puts JSON.pretty_generate(audio_data)