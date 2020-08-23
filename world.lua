require "structure"

world = {}

function world:init(width, height)
    self.width = width
    self.height = height
end

function world:generate(blocks)
    self.tileMap = {}
    for i=0,200 do
        self.tileMap[i] = {}
        for j=0,200 do
            random = math.random(500)
            if random < 5 then
                self.tileMap[i][j] = stone_one
            elseif random > 5 and random < 7 then
                self.tileMap[i][j] = grass_one
            elseif random == 8 then
                self.tileMap[i][j] = redstone_one
            else
                self.tileMap[i][j] = water
            end
        end
    end
    -- self:generateStructures()
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
