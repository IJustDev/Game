require "logincommand"
require "logoutcommand"
require "movecommand"
require "updatecommand"

commandhandler = {}

function commandhandler:handle(entity, cmd, args)
    if cmd == "L" then
        return logincommand:handle(entity)
        -- login
    elseif cmd == "Q" then
        return logoutcommand:handle(entity)
        -- logout 
    elseif cmd == "M" then
        -- move
        return movecommand:handle(entity, cmd, args)
    elseif cmd == "U" then
        -- update
        return updatecommand:handle(entity, cmd, args)
    end
end

