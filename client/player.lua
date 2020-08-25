all_players = {}

player = {}

function player:init(entity, world)
    o = {}
    player.character_sprite = getSprite(sprites.images.character, 0, 0, 64, 96)
    self.grid = anim8.newGrid(75, 103, sprites.images.character:getWidth(), sprites.images.character:getHeight())
    self.animation = anim8.newAnimation(self.grid('1-3', 1), 0.2)
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
    table.insert(self.items, item)
end

function player:draw()
    self.animation:draw(sprites.images.character, self.x, self.y)
    if self.isDead then
        love.graphics.print("RIP", self.x + 15, self.y - 15)
    else
        love.graphics.rectangle("fill", self.x, self.y, self.health, 5)
    end
end

function player:update(dt)
    self.animation:update(dt)
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
    -- self.world:destroyBlockAt(self.x, self.y)

end

function player:interact()
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

