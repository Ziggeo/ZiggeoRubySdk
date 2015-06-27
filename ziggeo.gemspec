$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "Ziggeo"
  s.version     = "1.02"
  s.authors     = ["Ziggeo, Inc"]
  s.email       = ["support@ziggeo.com"]
  s.homepage    = "http://ziggeo.com"
  s.summary     = "The Ziggeo ServerSDK gem."
  s.description = "The Ziggeo Ruby and Rails Server SDK."
  s.files = Dir["{app,config,db,lib}/**/*", "README.md"]
  s.require_paths = ["lib"]
  s.license     = 'MIT'
end
