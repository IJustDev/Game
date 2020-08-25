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

local movementTimer = 0
function localplayer:update(dt)
    if self.isDead then
        goto continue
    end
    local lastX, lastY = self.x, self.y
    if love.keyboard.isDown("w") then
        self.direction = "w"
        self.y = self.y - self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("s") then
        self.direction = "s"
        self.y = self.y + self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("a") then
        self.direction = "a"
        self.x = self.x - self.speed
        self.net:updatePosition(self.x, self.y)
    elseif love.keyboard.isDown("d") then
        self.direction = "d"
        self.x = self.x + self.speed
        self.net:updatePosition(self.x, self.y)
    end
    if love.keyboard.isDown("lctrl") then
        self.speed = 25
    end
    if not love.keyboard.isDown("lctrl") then
        self.speed = 5
    end
    self:getAnimation(self.direction)
    -- movementTimer = movementTimer + dt
    -- movementTimer = movementTimer - 2
    if self.shoot_cooldown >= 1 then
        self.shoot_cooldown = self.shoot_cooldown - 1
    end
    ::continue::
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
    local currentBlock = self.world:getBlockAt(self.x, self.y)
    self:addItem(currentBlock:getItem())
    player.dig(self)
end
