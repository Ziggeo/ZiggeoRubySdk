require_relative "../lib/Ziggeo"

@videos = Ziggeo.new(ARGV[0], ARGV[1], ARGV[2]).videos.index("approved" => "APPROVED")

print @videos.length