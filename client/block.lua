block = {}

function block:new(id, solid, blockSprite, hardness, item, replacement)
    o = {}
    o.id = id
    o.solid = solid
    o.item = item
    o.hardness = hardness
    o.sprite = blockSprite
    o.replacement_block = replacement 
    self.__index = self
    setmetatable(o, self)
    return o
end

function block:getId()
    return self.id
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

-- After the player destroys a block like coal for example
-- The stone block will be rendered.
function block:getReplacementBlock()
    return self.replacement_block
end

function block:isDiggable()
    return self.hardness ~= -1
end
