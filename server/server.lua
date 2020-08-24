local socket = require("socket")
require "utils"
require "commandhandler"

server = {}

local function istable(t) return type(t) == 'table' end

function server:start()
    local address = "localhost"
    local port = 25565

    self.udp = socket.udp()
    self.udp:settimeout(timeout)
    self.udp:setsockname(address,port)

end

players = {}

function server:listen()
    while true do
        data, msg_or_ip, port_or_nil = self.udp:receivefrom()
        if data then
            local request = split(data)
            local entity = request[1]
            local command = request[2]
            local response = commandhandler:handle(entity, command, request)
            if istable(response) then
                for i=1,table.getn(response) do
                    print("Sending: ".. response[i].. "to entity: "..entity)
                    self.udp:sendto(response[i], msg_or_ip, port_or_nil)
                end
            else
                if response ~= nil then
                    print("Sending: " .. response)
                    self.udp:sendto(response, msg_or_ip, port_or_nil)
                end
            end
        end
    end
end

server:start()
server:listen()
