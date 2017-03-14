require_relative "../lib/Ziggeo"

@videos = Ziggeo.new('APP_TOKEN','PRIVATE_KEY', 'ENCRYPTION_KEY').videos.index()

print @videos.length