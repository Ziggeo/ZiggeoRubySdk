require_relative "../lib/Ziggeo"

permissions = {session_owned: true}
@auth_token = Ziggeo.new('APP_TOKEN','PRIVATE_KEY', 'ENCRYPTION_KEY').authtokens.create(grants:
{create: permissions,
  read: permissions,
  update: permissions,
  destroy: permissions}.to_json)

print @auth_token
