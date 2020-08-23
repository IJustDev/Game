commandhandler = {}

function commandhandler:insertPlayerIfNotExistant(entity)
    if indexOfPlayer(entity) == -1 then
        local player = {}
        player.entity = entity
        player.x = x
        player.y = y
        table.insert(all_players, player)
    end
end

function commandhandler:updatePlayer(entity, x, y)
    local index = indexOfPlayer(entity)
    if index == -1 then
        self:insertPlayerIfNotExistant(entity)
        self:updatePlayer(entity, x, y)
        return
    end
    all_players[index].x = x
    all_players[index].y = y
end

function commandhandler:handle(cmd, params)
    for i = 1, table.getn(params) do
    end
    if cmd == "M" then
        self:updatePlayer(params[1], params[2], params[3])
    elseif cmd == "HIT" then
    elseif cmd == "ITEM" then
    end

end

