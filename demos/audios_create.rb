=begin
	This script shows you how to upload an audio.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. FILE

	Example call:
		ruby audios_create.rb APP_TOKEN PRIVATE_KEY FILE
=end

require_relative "../lib/Ziggeo"

puts Ziggeo.new(ARGV[0], ARGV[1]).audios.create(nil, ARGV[2])