$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "Ziggeo"
  s.version     = "1.17"
  s.authors     = ["Ziggeo, Inc"]
  s.email       = ["support@ziggeo.com"]
  s.homepage    = "https://ziggeo.com"
  s.summary     = "The Ziggeo ServerSDK gem."
  s.description = "The Ziggeo Ruby and Rails Server SDK."
  s.files = Dir["{app,config,db,lib}/**/*", "README.md"]
  s.require_paths = ["lib"]
  s.license     = 'Apache 2.0'
  s.add_dependency 'httparty', '~> 0.13.5'
  s.add_dependency 'httmultiparty'
end
