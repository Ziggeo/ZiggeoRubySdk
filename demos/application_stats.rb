require_relative "../lib/Ziggeo"

@stats = Ziggeo.new(ARGV[0], ARGV[1], ARGV[2]).application.get_stats()

print @stats