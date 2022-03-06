=begin
	This script shows you how to create a webhook, which you'll later need to confirm.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. SERVER_URL
		4. EVENTS
	
	Example call:
		ruby webhooks_create.rb APP_TOKEN PRIVATE_KEY SERVER_URL video_create
		ruby webhooks_create.rb APP_TOKEN PRIVATE_KEY SERVER_URL video_create video_delete video_failed
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];
server_url = ARGV[2];
events_to_catch = ARGV[3];

ziggeo = Ziggeo.new(app_token, private_key)

webhook_id = ziggeo.webhooks.create(
	target_url: server_url,
	events: events_to_catch
)

puts webhook_id