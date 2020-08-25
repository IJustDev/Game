all_players = {}

player = {}

function player:init(entity, world)
    o = {}
    player.character_sprite = getSprite(sprites.character, 0, 0, 64, 96)
    o.x = 0
    o.y = 0
    o.world = world
    o.speed = 3
    o.dir = "w"
    o.shoot_cooldown = 0
    o.items = {}
    o.health = 20
    o.isDead = false
    o.entity = entity
    o.money = 1000
    setmetatable(o, self)
    self.__index = self
    table.insert(all_players, o)
    return o
end

function player:addItem(item)
    table.insert(o.items, item)
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
    if self.isDead then
        love.graphics.print("RIP", self.x + 15, self.y - 15)
    else
        love.graphics.rectangle("fill", self.x, self.y, self.health, 5)
    end
end

function player:hasItemInInventory(id)
    for i=1,table.getn(self.items) do
        local item = self.items[i]
        if item.id == "d:arrow" then
            return true
        end
    end
    return false
end

function player:shoot()
    if self.shoot_cooldown == 0 then
        if not self:hasItemInInventory("d:arrow") then
            local bullet = projectile:new(self.x, self.y, self.direction, self)
            self.shoot_cooldown = 15
        end
    end
end

function player:getItems()
    return self.items
end

function player:dig()
    self.world:destroyBlockAt(self.x, self.y)
end

function player:hit()
    local nearby = self:getNearbyPlayers(3)
    for i=1, table.getn(nearby) do
        local nearbyPlayer = nearby[i]
        if nearbyPlayer ~= self then
            nearbyPlayer:setHealth(nearbyPlayer:getHealth() - 2)
        end
    end
end

function player:getHealth()
    return self.health
end

function player:setHealth(health)
    if health <= 0 then
        -- player died
        self.isDead = true
        self.health = 0
        self:kill()
    else
        self.health = health
    end
end

function player:kill()
    local index = indexOf(all_players, self)
    table.remove(all_players, index)
end

function player:getMoney()
    return self.money
end

function player:setMoney(money)
    self.money = money
end

function player:addMoney(money)
    self:setMoney(self:getMoney() + money)
end

function player:damage(damage)
    self:setHealth(self:getHealth() - damage)
end

function player:getNearbyPlayers(radius)
    local nearby = {}
    local mX, pX = self.x - radius * 32, self.x + radius * 32
    local mY, pY = self.y - radius * 32, self.y + radius * 32

    for i=1,table.getn(all_players) do
        local networkPlayer = all_players[i]
        if networkPlayer.x >= mX and networkPlayer.x <= pX and networkPlayer.y >= mY and networkPlayer.y <= pY then
            table.insert(nearby, networkPlayer)
        end
    end
    return nearby
end

