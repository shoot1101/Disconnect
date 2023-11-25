fx_version('bodacious')
game('gta5')
lua54 'yes'

author 'Bob & Co'
description 'Disconnect'
version '1.0.1'

shared_scripts {
	'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}
