packet = {}

function packet:new(name)
    o = {}
    o.members = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

