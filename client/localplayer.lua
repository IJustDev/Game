localplayer = player:init()

function localplayer:init(net, entity, world)
    self.world = world
    local spawnPoint = self.world:getSpawnPoint()
    self.x = spawnPoint.x
    self.y = spawnPoint.y
    self.net = net
    self.speed = 5
    return self
end

function localplayer:update(dt)
    if self.isDead then
        goto continue
    end
    local lastX, lastY = self.x, self.y
    if love.keyboard.isDown("w") then
        if self.direction ~= "w" then
            self.animation = anim8.newAnimation(self.grid('1-3', 4), 0.2)
        end
        self.direction = "w"
        self.y = self.y - self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("s") then
        if self.direction ~= "s" then
            self.animation = anim8.newAnimation(self.grid('1-3', 1), 0.2)
        end
        self.direction = "s"
        self.y = self.y + self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("a") then
        if self.direction ~= "a" then
            self.animation = anim8.newAnimation(self.grid('1-3', 2), 0.2)
        end
        self.direction = "a"
        self.x = self.x - self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("d") then
        if self.direction ~= "d" then
            self.animation = anim8.newAnimation(self.grid('1-3', 3), 0.2)
        end
        self.direction = "d"
        self.x = self.x + self.speed
        self.net:updatePosition(self.x, self.y)
    end
    self.animation:update(dt)
    self:checkSprint()
    ::continue::
end

function localplayer:checkSprint()
    if love.keyboard.isDown("lctrl") then
        self.speed = 25
    end
    if not love.keyboard.isDown("lctrl") then
        self.speed = 5
    end
end

function localplayer:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    if key == "space" then
        self:shoot()
    end
    if key == "k" then
        self:dig()
    end
    if key == "j" then
        -- self:hit()
    end
end

function localplayer:draw()
    player.draw(self)
    love.graphics.print("You", self.x + 15, self.y - 15)
end

function localplayer:dig()
    local targetBlock = self.world:destroyBlockAt(self.x, self.y)
    if targetBlock ~= nil then
        self:addItem(targetBlock:getItem())
        player.dig(self)
    end
end
