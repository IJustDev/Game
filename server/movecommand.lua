movecommand = {}

function movecommand:handle(entity, cmd, args)
    local index = indexOfPlayer(entity)
    print(table.getn(players))
    if index ~= -1 then
        players[index].x = args[3]
        players[index].y = args[4]
        return 0
    else
        newPlayer = {}
        newPlayer.entity = entity
        newPlayer.x = 0
        newPlayer.y = 0
        table.insert(players, newPlayer)
        return 1
    end
end
