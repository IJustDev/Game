commandhandler = {}

function commandhandler:updatePlayer(entity, x, y)
    if networkplayer:getByEntity(entity) == nil then
        networkplayer:init(entity, "U-"..entity)
    end

    local target = networkplayer:getByEntity(entity)
    target:updateCoordinates(x, y)
end

function commandhandler:handle(cmd, params)
    if cmd == "M" then
        if params[1] ~= entityId then
            self:updatePlayer(params[1], params[2], params[3])
        end
    elseif cmd == "MAP" then
        worldInitialized = true
        local chunkX, chunkY = params[1], params[2]
        local c = initializedWorld:getChunkAt(chunkX, chunkY)
        local serializedBlocks = {}
        for i=3, 16*16 + 3 do
            table.insert(serializedBlocks, params[i])
        end
        c:readNoise(serializedBlocks)
        c:parseToBlocks()
        print(c.blocks)
    end

end

