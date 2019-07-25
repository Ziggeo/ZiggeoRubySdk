=begin
  This script shows you how to confirm a webhook to start catching events.

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY
    3. WEBHOOK_ID
    4. VALIDATION_CODE
  
  Example call:
    ruby webhooks_confirm.rb APP_TOKEN PRIVATE_KEY WEBHOOK_ID VALIDATION_CODE
=end

require_relative "../lib/Ziggeo"

app_token, private_key, webhook_id, validation_code = ARGV

@ziggeo = Ziggeo.new(app_token, private_key)

response = @ziggeo.webhooks.confirm(
  webhook_id: webhook_id,
  validation_code: validation_code
)

puts response