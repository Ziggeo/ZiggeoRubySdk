require_relative "../lib/Ziggeo"

@count = Ziggeo.new(ARGV[0], ARGV[1], ARGV[2]).videos.count()

print @count['count']