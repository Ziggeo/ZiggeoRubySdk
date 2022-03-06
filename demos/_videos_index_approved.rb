require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];

ziggeo = Ziggeo.new(app_token, private_key)

videos = ziggeo.videos.index("approved" => "APPROVED")

print videos.length