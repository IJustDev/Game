joincommand = {}

function joincommand:handle(entity, cmd, args, ip, port)
    local channelMember = channelmember.getByIpAndPort(ip, port)
    if channelMember == nil then
        channelMember = channelmember:new(ip, port, entity)
    end
    local channelName = args[3]
    local channel = channel.getByName(channelName)
    channel:add(channelMember)
    print(channel:getMembers()[1])
end
