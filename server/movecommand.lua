movecommand = {}

function movecommand:serializePlayer(player)
    return string.format("M %s %d %d", player.entity, player.x, player.y)
end

function movecommand:handle(entity, cmd, args, ip, port)
    local target = channelmember.getByEntityId(entity)
    local lastX, lastY = target.x, target.y

    if target == nil then
        target = channelmember:new(entity, ip, port)
        movement:add(target)
        target:updatePosition(args[3], args[4])
        lastX = 0
        lastY = 0
    else
        target:updatePosition(args[3], args[4])
    end

    movement:sendtoAll(self:serializePlayer(target))

    if target:leavesChunk(lastX, lastY) then
        local chunkX, chunkY = target:getChunk()
        local c = gameWorld:getChunksNearby(chunkX, chunkY, 1)
        print(c[1]:serialize(chunkX, chunkY))
        movement:sendtoAll("MAP " ..c[1]:serialize(chunkX, chunkY))
    end
end
