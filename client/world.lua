require "structure"

world = {}

function world:init(width, height)
    o = {}
    o.width = width
    o.height = height
    o.spawnPoint = {x = 128, y = 128}
    o.tileMap = {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function world:getSpawnPoint()
    return self.spawnPoint
end

function world:generate()
    self.tileMap = {}
    for i=0,200 do
        self.tileMap[i] = {}
        for j=0,200 do
            self.tileMap[i][j] = block_stone
        end
    end
    self.tileMap[2][2] = block_ore_diamond
    return world
end

function world:generateStructures()
    local xRandom = math.random(20)
    local yRandom = math.random(20)
    local houseStruct = structure:generate()
    for i=1,table.getn(houseStruct) do
        for j=1,table.getn(houseStruct[i]) do
            self.tileMap[i+yRandom][j+xRandom] = houseStruct[i][j]
        end
    end
end

function world:getTileMap()
    return self.tileMap
end

function world:getBlockAt(x, y)
    local blockX = math.ceil(x/64)
    local blockY = math.ceil(y/64)
    return self.tileMap[blockX][blockY]
end

function world:destroyBlockAt(x, y)
    local targetBlock = self:getBlockAt(x, y)
    if targetBlock ~= nil and targetBlock:isDiggable() then
        self.tileMap[math.ceil(x/64)][math.ceil(y/64)] = targetBlock:getReplacementBlock()
        return targetBlock
    else
        return nil
    end
end

function world:draw()
    for x=0,150 do
        for y=0,150 do
            local b = self.tileMap[x][y]
            if b ~= nil then
                love.graphics.draw(sprites.images.tileset, b:getSprite(), x*64, y*64)
            end
        end
    end
end
