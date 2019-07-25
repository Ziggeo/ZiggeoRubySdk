=begin
  This script shows you how get the total number of videos in your application.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY

  Example call:
    ruby videos_count.rb APP_TOKEN PRIVATE_KEY
    ruby videos_count.rb APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

result = Ziggeo.new(*ARGV).videos.count()

puts result["count"]