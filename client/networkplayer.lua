network_players = {}

networkplayer = player:init()

function networkplayer:init(entity, username)
    self.entity = entity
    self.username = username
    table.insert(network_players, self)
    return self
end

function networkplayer:draw()
    player.draw(self)
    if not self.isDead then
        love.graphics.print(self.username, self.x + 15, self.y - 15)
    end
end

function networkplayer:getEntity()
    return self.entity
end

function networkplayer:updateCoordinates(x, y)
    self.x = x
    self.y = y
end

function networkplayer.drawAll()
    for i=1,table.getn(network_players) do
        local nwPlayer = network_players[i]
        nwPlayer:draw()
    end
end

function networkplayer:updateAll(dt)
    for i=1,table.getn(network_players) do
        local nwPlayer = network_players[i]
        nwPlayer:update(dt)
    end
end

function networkplayer:getByEntity(entity)
    for i=1,table.getn(network_players) do
        local target = network_players[i]
        if target.entity == entity then
            return target
        end
    end
    return nil
end
