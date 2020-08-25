require "logincommand"
require "logoutcommand"
require "movecommand"
require "joincommand"

commandhandler = {}

function commandhandler:handle(entity, cmd, args, ip, port)
    if cmd == "L" then
        return logincommand:handle(entity)
        -- login
    elseif cmd == "Q" then
        return logoutcommand:handle(entity)
        -- logout 
    elseif cmd == "M" then
        -- move
        return movecommand:handle(entity, cmd, args, ip, port)
    elseif cmd == "J" then
        return joincommand:handle(entity, cmd, args, ip, port)
    end

end

