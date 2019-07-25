=begin
  This script shows you how to upload a video.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. FILE

  Example call:
    ruby videos_create.rb APP_TOKEN PRIVATE_KEY FILE
=end

require_relative "../lib/Ziggeo"

puts Ziggeo.new(ARGV[0], ARGV[1]).videos.create(nil, ARGV[2])