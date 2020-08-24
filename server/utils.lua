function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in  string.gmatch(inputstr, "%S+") do
        table.insert(t, str)
    end
    return t
end

function indexOfPlayer(entity)
    for i=1,table.getn(players) do
        if players[i].entity == entity then
            return i
        end
    end
    return -1
end

