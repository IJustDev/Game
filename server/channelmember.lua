channelmembers = {}
channelmember = {}

function channelmember:new(ip, port, entity)
    o = {}
    o.ip = ip
    o.port = port
    o.entity = entity
    o.x = 0
    o.y = 0
    setmetatable(o, self)
    self.__index = self
    table.insert(channelmembers, o)
    return o
end

function channelmember:updatePosition(x, y)
    print(x)
    print(y)
    self.x = x
    self.y = y
end

function channelmember:getPosition()
    return {x=self.x, y=self.y}
end

function channelmember.getByIpAndPort(ip, port)
    for i=1,table.getn(channelmembers) do
        if channelmembers[i].ip == ip
            and channelmembers.port == port then
            return channelmembers[i]
        end
    end
end

function channelmember.getByEntityId(entity)
    for i=1,table.getn(channelmembers) do
        if channelmembers[i].entity == entity then
            return channelmembers[i]
        end
    end
end
