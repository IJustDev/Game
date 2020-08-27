channelmembers = {}
channelmember = {}

function channelmember:new(ip, port, entity)
    o = {}
    o.ip = ip
    o.port = port
    o.entity = entity
    o.x = 0
    o.y = 0
    setmetatable(o, self)
    self.__index = self
    table.insert(channelmembers, o)
    return o
end

function channelmember:updatePosition(x, y)
    self.x = x
    self.y = y
    local chunkX, chunkY = gameWorld:fromPlayerToChunkCoordinate(x ,y)
    gameWorld:getChunksNearby(chunkX, chunkY, 3)
end

function channelmember:getPosition()
    return self.x, self.y
end

function channelmember:getChunk()
    return math.ceil(self.x / 64 / 16), math.ceil(self.y / 64 / 16)
end

function channelmember:leavesChunk(lastX, lastY)
    local lastChunkX, lastChunkY = world:fromPlayerToChunkCoordinate(lastX or 0, lastY or 0)
    local chunkX, chunkY = world:fromPlayerToChunkCoordinate(self.x, self.y)
    
    if lastChunkX ~= chunkX or lastChunkY ~= chunkY then
        return true
    end
    return false
end

function channelmember.getByIpAndPort(ip, port)
    for i=1,table.getn(channelmembers) do
        if channelmembers[i].ip == ip
            and channelmembers.port == port then
            return channelmembers[i]
        end
    end
end

function channelmember.getByEntityId(entity)
    for i=1,table.getn(channelmembers) do
        if channelmembers[i].entity == entity then
            return channelmembers[i]
        end
    end
end
