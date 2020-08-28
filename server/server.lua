local socket = require("socket")
require "utils"
require "channel"
require "channelmember"
require "commandhandler"
require "world"
require "chunk"
require "world"

server = {}

function server:start()
    local address = "0.0.0.0"
    local port = 25566

    gameWorld = world:new()
    gameWorld:initializeChunks()

    self.udp = socket.udp()
    self.udp:settimeout(timeout)
    self.udp:setsockname(address,port)
    movement = channel:new("movement", self.udp)
    
end

function server:listen()
    while true do
        data, msg_or_ip, port_or_nil = self.udp:receivefrom()
        if data then
            local request = split(data)
            local entity = request[1]
            local command = request[2]
            local response = commandhandler:handle(entity, command, request, msg_or_ip, port_or_nil)
        end
    end
end

function server:sendMessage(message, ip, port)
    self.udp:sendto(message, ip, port)
end

function server:answerInThread(message, ip, port)
    local cp = coroutine.create(function()
        self:sendMessage(message, ip, port)
    end)
    coroutine.resume(cp)
end

server:start()
server:listen()
