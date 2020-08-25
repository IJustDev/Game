block = {}

function block:new(solid, blockSprite, hardness, item)
    o = {}
    o.solid = solid
    o.item = item
    o.hardness = hardness
    o.sprite = blockSprite
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
end

function block:getItem()
    return self.item
end

function block:getHardness()
    return self.harndess
end

