require "perlin"

chunk = {}
local scale = 0.15

function chunk:new(x, y)
    o = {}
    o.blocks = {}
    o.x = x
    o.y = y
    self.__index = self
    setmetatable(o, self)
    return o
end

function chunk:generate(seed)
    for x=1,16 do
        self.blocks[x] = {}
        for y=1,16 do
            self.blocks[x][y] = noise(x*scale * self.x, y*scale * self.y, 0)
        end
    end
end

function chunk:getBlocks()
    return self.blocks
end

function chunk:serialize(x, y)
    local serialized = x.. " " ..y 
    for x=1,16 do
        for y=1,16 do
            serialized = serialized.." "..
                string.format("%.2f", self.blocks[x][y])
        end
    end
    return serialized 
end
