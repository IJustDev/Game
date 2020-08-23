player = {}
local speed = 5

function player:init(map)
    player.character_sprite = getSprite(sprites.character, 0, 0, 64, 96)
    self.x = 0
    self.y = 0
    self.xp = 0
    self.shoot_cooldown = 0
    self.dir = "w"
    self.isWalking = false
    self.map = map
    self:getAnimation()
    self.items = {}
    table.insert(self.items, item_staff)
    table.insert(self.items, item_pickaxe)
end

function player:update()
    if love.keyboard.isDown("w") then
        self.direction = "w"
        self.y = player.y - speed
    end
    if love.keyboard.isDown("s") then
        self.direction = "s"
        self.y = self.y + speed
    end
    if love.keyboard.isDown("a") then
        self.direction = "a"
        self.x = self.x - speed
    end
    if love.keyboard.isDown("d") then
        self.direction = "d"
        self.x = self.x + speed
    end
    self:getAnimation(self.direction)
    if self.shoot_cooldown >= 1 then
        self.shoot_cooldown = self.shoot_cooldown - 1
    end
end

function player:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    if key == "space" then
        player:shoot()
    end
end

function player:getAnimation(direction)
    -- 50x92
    -- Distance between sprites 30
    if self.direction == "w" then
        self.character_sprite = love.graphics.newQuad(0, 325, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "s" then
        self.character_sprite = love.graphics.newQuad(100+60, 0, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "a" then
        self.character_sprite = love.graphics.newQuad(0, 120, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "d" then
        self.character_sprite = love.graphics.newQuad(0, 225, 50, 92, sprites.character:getDimensions())
    end
end

function player:draw()
    love.graphics.draw(sprites.character, self.character_sprite, self.x, self.y)
end

function player:interact()
end

function player:dig()
end

function player:shoot()
    if self.shoot_cooldown == 0 then
        local bullet = newProjectile(self.x, self.y, self.direction)
        table.insert(projectiles, bullet)
        self.shoot_cooldown = 25
    end
end

function player:getItems()
    return self.items
end
