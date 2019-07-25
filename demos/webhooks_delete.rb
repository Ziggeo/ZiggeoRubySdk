=begin
  This script shows you how to delete a webhook.

  Parameters you need to pass:
    1. WEBHOOK_URL
    2. APP_TOKEN
    3. PRIVATE_KEY
  
  Example call:
    ruby webhooks_delete.rb WEBHOOK_ID APP_TOKEN PRIVATE_KEY
    ruby webhooks_delete.rb WEBHOOK_ID APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

server_url = ARGV.shift()

@ziggeo = Ziggeo.new(*ARGV)

response = @ziggeo.webhooks.delete(
  target_url: server_url
)

puts response == "null" ? "Webhook deleted." : response