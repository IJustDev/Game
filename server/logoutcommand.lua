logoutcommand = {}

function logoutcommand:handle()
    local index = indexOfPlayer(entity)
    if index == -1 then
        return 1
    else
        return 0
    end
end
