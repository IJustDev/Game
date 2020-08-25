updatecommand = {}

function updatecommand:serializePlayer(player)
    return string.format("M %s %d %d", player.entity, player.x, player.y)
end

function updatecommand:handle()
    messages = {}
    return messages
end
