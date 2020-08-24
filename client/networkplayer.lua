networkplayer = player:init()

function networkplayer:init(entity, username)
    player.init(self)
    self.entity = entity
    self.username = username
    self.x = 100
    self.y = 100
    self.skin = 10
    return self
end

function networkplayer:update()
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
