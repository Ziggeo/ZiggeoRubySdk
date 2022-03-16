=begin
	This script shows you how get the total number of audios in your application.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY

	Example call:
		ruby audios_count.rb APP_TOKEN PRIVATE_KEY
		ruby audios_count.rb APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

result = Ziggeo.new(*ARGV).audios.count()

puts result["count"]