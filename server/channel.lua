channels = {}
channel = {}

function channel:new(name, udp)
    o = {}
    o.name = name
    o.members = {}
    self.udp = udp
    setmetatable(o, self)
    self.__index = self
    table.insert(channels, o)
    return o
end

function channel:add(channelmember)
    for i=1, table.getn(self.members) do
        if self.members[i].channelmember == channelmember then
            return
        end
    end
    table.insert(self.members, channelmember)
end

function channel:getMembers()
    return self.members
end

function channel:sendtoAll(message)
    for i=1,table.getn(self.members) do
        local member = self.members[i]
        self.udp:sendto(message, member.ip, member.port)
    end
end

function channel.getByName(name)
    for i=1, table.getn(channels) do
        local target = channels[i]
        if target.name == name then
            return target
        end
    end
end
