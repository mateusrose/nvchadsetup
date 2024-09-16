which deactivate-lua >&/dev/null && deactivate-lua

alias deactivate-lua 'if ( -x '\''/home/mateus/.config/nvim/lua_env/bin/lua'\'' ) then; setenv PATH `'\''/home/mateus/.config/nvim/lua_env/bin/lua'\'' '\''/home/mateus/.config/nvim/lua_env/bin/get_deactivated_path.lua'\''`; rehash; endif; unalias deactivate-lua'

setenv PATH '/home/mateus/.config/nvim/lua_env/bin':"$PATH"
rehash
