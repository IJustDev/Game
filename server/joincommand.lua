joincommand = {}

function joincommand:handle(entity, cmd, args, ip, port)
    local channelMember = channelmember.getByIpAndPort(ip, port)
    if channelMember == nil then
        channelMember = channelmember:new(ip, port, entity)
    end
    local channelName = args[3]
    local channel = channel.getByName(channelName)
    channel:add(channelMember)
    local c = gameWorld:getChunksNearby(0, 0, 1)
    channel:sendtoAll("MAP " ..c[1]:serialize(0, 0))
end
