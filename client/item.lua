item = {}

local width, height = 16,16

function item:new(id, spriteX, spriteY)
    o = {}
    o.id = id
    o.sprite = getSprite(sprites.items, spriteX*16, spriteY*16, 16, 16)
    setmetatable(o, self)
    self.__index = self
    return o
end

item_pickaxe = item:new("d:pick", 5, 6)
item_spade = item:new("d:spade", 5, 12)
item_staff = item:new("d:staff", 4, 11)

item_arrow = item:new("d:arrow", 11, 9)
