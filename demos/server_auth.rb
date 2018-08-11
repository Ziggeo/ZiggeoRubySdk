require_relative "../lib/Ziggeo"

permissions = {session_owned: true}
@auth_token = Ziggeo.new(ARGV[0], ARGV[1], ARGV[2]).authtokens.create(grants:
{create: permissions,
  read: permissions,
  update: permissions,
  destroy: permissions}.to_json)

print @auth_token
