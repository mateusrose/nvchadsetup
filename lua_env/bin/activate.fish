if functions -q deactivate-lua
    deactivate-lua
end

function deactivate-lua
    if test -x '/home/mateus/.config/nvim/lua_env/bin/lua'
        eval ('/home/mateus/.config/nvim/lua_env/bin/lua' '/home/mateus/.config/nvim/lua_env/bin/get_deactivated_path.lua' --fish)
    end

    functions -e deactivate-lua
end

set -gx PATH '/home/mateus/.config/nvim/lua_env/bin' $PATH
