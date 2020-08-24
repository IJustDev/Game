block = {}

local width = 32
local height = 32

function block:new(solid, spriteX, spriteY, hardness, item)
    o = {}
    o.solid = solid
    o.item = item
    o.hardness = hardness
    o.sprite = getSprite(sprites.floor, spriteX*width, spriteY*height, width, height)
    setmetatable(o, self)
    self.__index = self
    return o
end

function block:isSolid()
    return self.solid
end

function block:getSprite()
    return self.sprite
end

function block:destroy()
    self.sprite = water:getSprite()
end

function block:getItem()
    return self.item
end

function block:getHardness()
    return self.harndess
end

