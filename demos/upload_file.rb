require_relative "../lib/Ziggeo"

Ziggeo.new(ARGV[0], ARGV[1], ARGV[2]).videos.create(nil, 'file')
