world = {}

chunkSize = 16
blockSize = 64 

function world:new()
    o = {}
    o.chunks = {}
    o.spawnPoint = {x = 300, y = 150}
    o.seed = 420
    self.__index = self
    setmetatable(o, self)
    return o
end

function world:initializeChunks()
    self:getChunksNearby(0, 0, 3)
end 
-- chunkX is not the players x coordinate but the chunk index
function world:generateChunkAt(chunkX, chunkY)
    local c = chunk:new(chunkX, chunkY)
    self:createChunkSubArrayIfNotExistant(chunkX)
    c:generate(self.seed)
    self.chunks[chunkX][chunkY] = c
    return c
end

function world:getChunkAt(chunkX, chunkY)
    self:createChunkSubArrayIfNotExistant(chunkX)
    local c = self.chunks[chunkX][chunkY]

    if c == nil then
        c = self:generateChunkAt(chunkX, chunkY)
    end
    return c
end

function world:getChunksNearby(chunkX, chunkY, radius)
    local nearby = {}
    for x=-radius,radius do
        for y=-radius,radius do
            table.insert(nearby, self:getChunkAt(chunkX + x, chunkY + y))
        end
    end
    return nearby
end

function world:createChunkSubArrayIfNotExistant(x)
    if self.chunks[x] == nil then
        self.chunks[x] = {}
    end
end

function world:getChunks()
    return self.chunks
end

function world:fromPlayerToChunkCoordinate(x, y)
    return math.ceil(x / blockSize / chunkSize),
           math.ceil(y / blockSize / chunkSize)
end
