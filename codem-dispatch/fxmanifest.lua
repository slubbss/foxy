fx_version 'cerulean'
game "gta5"
author "CodeM & Magni"
version '1.1.1'

lua54 'yes'

shared_script {
    'shared/*.lua'
}

client_script {
    'client/*.lua',
    'editable/blips.lua',
    'editable/client_editable.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua'
}

server_scripts {
    'server/*.lua',
    'editable/server_editable.lua',
    'editable/qbcommands.lua',
    'editable/esxcommands.lua'
}

ui_page 'nui/index.html'

files {
	'nui/**/*',
}

escrow_ignore {
    'editable/*.lua',
    'shared/*.lua'
}

dependencies {
    '/gameBuild:2944',
    'PolyZone'
}
dependency '/assetpacks'