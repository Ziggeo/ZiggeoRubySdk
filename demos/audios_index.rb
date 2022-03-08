=begin
	This script shows you how to list all audios from your application.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY

	Example call:
		ruby audios_index.rb APP_TOKEN PRIVATE_KEY
		ruby audios_index.rb APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

@ziggeo = Ziggeo.new(*ARGV)

audios = []
skip = 0
limit = 100

loop do
	audios = @ziggeo.audios.index(
		"skip": skip,
		"limit": limit
	)

	audios.each {
		|audio| puts "Listing " + audio["token"]
		skip += 1
	}

	break if audios.length == 0
end