chunk = {}

function chunk:new(x, y)
    o = {}
    o.blocks = {}
    o.noise = {}
    o.x = x
    o.y = y
    self.__index = self
    setmetatable(o, self)
    return o
end

function chunk:readNoise(serialized)
    for x=1, 16 do
        self.noise[x] = {}
        for y=1, 16 do
            self.noise[x][y] = tonumber(serialized[x*y])
        end
    end
end

function chunk:parseToBlocks()
    for x=1,16 do
        self.blocks[x] = {}
        for y=1,16 do
            self.blocks[x][y] = self:determineBlock(self.noise[x][y])
        end
    end
end

function chunk:determineBlock(noiseValue)
    if noiseValue < 0.05 then
        return block_stone
    elseif noiseValue < 0.1 then
        return block_ore_diamond
    elseif noiseValue < 0.2 then
        return block_ore_coal
    elseif noiseValue < 0.25 then
        return block_wood
    else
        return block_stone
    end
end

function chunk:getBlockAt(x, y)
    return self.blocks[x][y]
end

function chunk:getBlocks()
    return self.blocks
end
