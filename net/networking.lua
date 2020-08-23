local socket = require "socket"
require "net/commandhandler"

networking = {}

-- Networking class
function networking:establish()
    self.udp = socket.udp()
    self.udp:settimeout(0)
    self.udp:setpeername("localhost", 42069)

    math.randomseed(os.time())
    self.entity = tostring(math.random(99999))

    self.commandqueue = {}
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

function networking:login()
    self:sendMessage("L")
end

function networking:logout()
    self:sendMessage("Q")
end

function networking:updatePosition(x, y)
    self:sendMessage(string.format("M %d %d", x, y))
end

local fetchTimer = 0
function networking:update(dt)
    fetchTimer = fetchTimer + dt
    if fetchTimer > 2 then
        self:sendMessage("U")
        fetchTimer = fetchTimer - 2
    end
    self:handle()
end

function networking:draw()
    for i=1, table.getn(all_players) do
        local networkPlayer = all_players[i]
        love.graphics.rectangle("fill", all_players[i].x, all_players[i].y, 50, 92)
    end
end

function networking:getUDPSocket()
    return self.udp
end

function networking:getCommandQueue()
    return self.queue
end
