local socket = require "socket"
require "net/commandhandler"

networking = {}

-- Networking class
function networking:establish(entity)
    self.udp = socket.udp()
    self.udp:settimeout(0)
    self.udp:setpeername("localhost", 25565)

    self.entity = entity

    self:sendMessage("J movement")

    return self
end

function networking:handle()
    data, msg = self.udp:receive()
    if data then
        -- Split params at ' '
        response = split(data, "%S+")
        commandArgs = table.slice(response, 2, table.getn(response))
        commandhandler:handle(response[1], commandArgs)
    end
end

function networking:sendMessage(message)
    local dg = string.format("%s %s", self.entity, message)
    self.udp:send(dg)
end

function networking:updatePosition(x, y)
    self:sendMessage(string.format("M %d %d", x, y))
end

local fetchTimer = 0
function networking:update(dt)
    self:handle()
end

function networking:getUDPSocket()
    return self.udp
end
