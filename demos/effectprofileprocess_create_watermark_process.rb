=begin
  This script shows you how to attach effect process (like watermark) to the existing effect profile
  Please note that effect profile has to exist for this to work. It can be anything, we are using key to make it easier

  Parameters you need to pass:
    1. APP_TOKEN
    2. PRIVATE_KEY

  Example call:
    ruby effectprofileprocess_create_watermark_process.rb APP_TOKEN PRIVATE_KEY
    ruby effectprofileprocess_create_watermark_process.rb APP_TOKEN PRIVATE_KEY ENCRIPTION_KEY
=end

require_relative "../lib/Ziggeo"

ziggeo = Ziggeo.new(*ARGV)

=begin
  We first create the effect profile, unless we were to use some existing profile, in which case we would use its key or token instead and skip this step
  Will not be setting up a key at this time, rather let system make a token for us.
=end
opts_profile = { "title" => "Ruby SDK Made Effect Profile" }

profile = ziggeo.effectProfiles().create( opts_profile )

puts profile
=begin
  Would be object such as:
  {
    "volatile"=>false,
    "token"=>"3765534c0024b619d7d9a9966e2e08f2",
    "key"=>nil,
    "title"=>"Ruby SDK Made Effect Profile",
    "default_effect"=>false,
    "type"=>"ApiEffectProfile",
    "created"=>1587044236,
    "owned"=>false
  }
=end

opts_watermark = { "video_scale" => '0.25', "horizontal_position" => '0.95', "vertical_position" => '0.95'}
watermark_path = "../sample/logo-white.png"

watermark = ziggeo.effectProfileProcess().create_watermark_process(profile['token'], opts_profile, watermark_path)

puts watermark
