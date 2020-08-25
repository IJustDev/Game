item = {}

function item:new(id, sprite)
    o = {}
    o.id = id
    o.sprite = sprite
    setmetatable(o, self)
    self.__index = self
    return o
end

