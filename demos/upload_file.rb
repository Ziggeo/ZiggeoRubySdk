require_relative "../lib/Ziggeo"

Ziggeo.new('APP_TOKEN','PRIVATE_KEY', 'ENCRYPTION_KEY').videos.create(nil, 'file')
