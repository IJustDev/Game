world = {}

function world:init()
    o = {}
    o.spawnPoint = {x = 128, y = 128}
    o.chunks = {}
    o.tileMap = {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function world:getSpawnPoint()
    return self.spawnPoint
end

function world:getTileMap()
    return self.tileMap
end

function world:getChunkIndexWithPlayerCoords(x, y)
    return x / 64 / 16, y / 64 / 16
end

function world:getChunkAt(chunkX, chunkY)
    for i=1, table.getn(self.chunks) do
        local c = self.chunks[i]
        if c.x == chunkX and c.y == chunkY then
            return c
        end
    end
    local c = chunk:new(chunkX, chunkY)
    table.insert(self.chunks, c)
    return c
end

function world:getBlockAt(x, y)
    local chunkX, chunkY = self:getChunkIndexWithPlayerCoords(x, y)
    return self:getChunkAt(chunkX, chunkY):getBlockAt(x, y)
end

function world:draw()
    for chunkIndex=1, table.getn(self.chunks) do
        local c = self.chunks[chunkIndex]
        for x=1,16 do
            for y=1,16 do
                local b = c:getBlocks()[x][y]
                    love.graphics.draw(
                    sprites.images.tileset,
                    b:getSprite(),
                    c.x + x*64,
                    c.y + y*64
                    )
            end
        end
    end
end
