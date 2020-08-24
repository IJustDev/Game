commandhandler = {}

function commandhandler:updatePlayer(entity, x, y)
    if networkplayer:getByEntity(entity) == nil then
        networkplayer:init(entity, "U-"..entity)
    end

    local target = networkplayer:getByEntity(entity)
    target:updateCoordinates(x, y)
    print(target.entity..";X:"..target.x.."Y:"..target.y)
end

function commandhandler:handle(cmd, params)
    if cmd == "M" then
        if params[1] ~= entityId then
            print(table.concat(params, ":"))
            self:updatePlayer(params[1], params[2], params[3])
        end
    elseif cmd == "HIT" then
    elseif cmd == "ITEM" then
    end

end

