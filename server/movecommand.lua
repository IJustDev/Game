movecommand = {}

function movecommand:serializePlayer(player)
    return string.format("M %s %d %d", player.entity, player.x, player.y)
end

function movecommand:handle(entity, cmd, args, ip, port)
    local target = channelmember.getByEntityId(entity)
    if target == nil then
        target = channelmember:new(entity, ip, port)
        movement:add(target)
        target:updatePosition(args[3], args[4])
    else
        target:updatePosition(args[3], args[4])
    end
    movement:sendtoAll(self:serializePlayer(target))
end
