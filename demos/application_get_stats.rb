require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];

ziggeo = Ziggeo.new(app_token, private_key)

stats = ziggeo.application.get_stats()

print stats