updatecommand = {}

function updatecommand:serializePlayer(player)
    return string.format("M %s %d %d", player.entity, player.x, player.y)
end

function updatecommand:handle()
    messages = {}
    for i=1, table.getn(players) do
        table.insert(messages, self:serializePlayer(players[i]))
    end
    return table.concat(messages, '\n')
end
