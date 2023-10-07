fx_version 'cerulean'
game 'gta5'

author 'Thomapp'
description 'Vehicle Location Script.'

client_scripts {
    'src/RageUI.lua',
    'src/Menu.lua',
    'src/MenuController.lua',
    'src/components/*.lua',
    'src/elements/*.lua',
    'src/items/*.lua',
    'client/*.lua'
}

server_script 'server/sv_main.lua'
shared_script 'shared.lua'