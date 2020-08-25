chunk = {}

function chunk:new(x, y)
    o = {}
    o.blocks = {}
    o.x = 0
    o.y = 0
    self.__index = self
    setmetatable(o, self)
    return o
end

function chunk:generate()
    for x=1,16 do
        for y=1,16 do
            self.blocks[x][y] = 1
        end
    end
end

