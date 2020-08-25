require "structure"

world = {}

function world:init(width, height)
    o = {}
    o.width = width
    o.height = height
    o.spawnPoint = {x = 64, y = 64}
    setmetatable(o, self)
    self.__index = self
    return o
end

function world:getSpawnPoint()
    return self.spawnPoint
end

function world:generate(blocks)
    self.tileMap = {}
    for i=0,200 do
        self.tileMap[i] = {}
        for j=0,200 do
            self.tileMap[i][j] = block_grass:new()
        end
    end
    self.tileMap[2][2] = block_crafting_table:new()
    return world
end

function world:generateStructures()
    local xRandom = math.random(20)
    local yRandom = math.random(20)
    local houseStruct = structure:generate()
    for i=1,table.getn(houseStruct) do
        for j=1,table.getn(houseStruct[i])do
            self.tileMap[i+yRandom][j+xRandom] = houseStruct[i][j]
        end
    end
end

function world:getTileMap()
    return self.tileMap
end

-- User is at X:44 and Y:39
-- Each tile is 32 pixels wide and high
function world:getBlockAt(x, y)
    local blockX = math.ceil(x/32)
    local blockY = math.ceil(y/32)
    return self.tileMap[blockX][blockY]
end

function world:destroyBlockAt(x, y)
    local blockX = math.ceil(x/64)
    local blockY = math.ceil(y/64)
    self.tileMap[blockX][blockY].sprite = sprites.items.pickaxe
end

