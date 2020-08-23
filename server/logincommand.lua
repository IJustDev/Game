logincommand = {}


function logincommand:handle(entity)
    if indexOfPlayer(entity) ~= -1 then
        return 1
    else
        local userThatWantsToConnect = {}
        userThatWantsToConnect.entity = entity
        userThatWantsToConnect.x = 0
        userThatWantsToConnect.y = 0
        table.insert(players, userThatWantsToConnect)
        return 0
    end
end

