=begin
	This script shows you how to delete a webhook.

	Parameters you need to pass:
		1. APP_TOKEN
		2. PRIVATE_KEY
		3. WEBHOOK_URL
	
	Example call:
		ruby webhooks_delete.rb APP_TOKEN PRIVATE_KEY WEBHOOK_URL
=end

require_relative "../lib/Ziggeo"

app_token = ARGV[0];
private_key = ARGV[1];
server_url = ARGV[2];

ziggeo = Ziggeo.new(app_token, private_key)

response = ziggeo.webhooks.delete(
	target_url: server_url
)

puts response == "null" ? "Webhook deleted." : response