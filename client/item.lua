item = {}

local width, height = 16,16

function item:new(spriteX, spriteY)
    o = {}
    o.sprite = getSprite(sprites.items, spriteX*16, spriteY*16, 16, 16)
    setmetatable(o, self)
    self.__index = self
    return o
end

item_pickaxe = item:new(5, 6)
item_spade = item:new(5, 12)
item_staff = item:new(4, 11)
