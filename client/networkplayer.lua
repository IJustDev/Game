networkplayer = player:init()

function networkplayer:init(entity, username)
    self.entity = entity
    self.username = username
    self.x = 100
    self.y = 100
    self.skin = 10
    player.init(self)
    return self
end

function networkplayer:update()
end

function networkplayer:draw()
    player.draw(self)
    love.graphics.print(self.username, self.x + 15, self.y - 15)
end

function networkplayer:initNetwork(networking)
    self.networking = networking
end

function networkplayer:getEntity()
    return self.entity
end

function networkplayer:updateCoordinates(x, y)
    self.x = x
    self.y = y
end
