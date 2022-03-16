require_relative "../lib/Ziggeo"


app_token = ARGV[0];
private_key = ARGV[1];

ziggeo = Ziggeo.new(app_token, private_key)

permissions = { session_owned: true }

auth_token = ziggeo.authtokens.create(grants:{
	create: permissions,
	read: permissions,
	update: permissions,
	destroy: permissions
}.to_json)

print auth_token