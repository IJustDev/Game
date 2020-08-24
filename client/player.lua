all_players = {}

player = {}

function player:init(world, skin)
    o = {}
    player.character_sprite = getSprite(sprites.character, 0, 0, 64, 96)
    o.x = 0
    o.y = 0
    o.speed = 3
    o.dir = "w"
    o.skin = skin
    o.shoot_cooldown = 0
    self.world = world
    o.items = {}
    o.health = 20
    table.insert(o.items, item_staff)
    table.insert(o.items, item_pickaxe)
    setmetatable(o, self)
    self.__index = self
    table.insert(all_players, o)
    return o
end

function player:getAnimation(direction)
    -- 50x92
    -- Distance between sprites 30
    if self.direction == "w" then
        self.character_sprite = love.graphics.newQuad(0, self.skin*325, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "s" then
        self.character_sprite = love.graphics.newQuad(self.skin*100+60, 0, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "a" then
        self.character_sprite = love.graphics.newQuad(0, self.skin*120, 50, 92, sprites.character:getDimensions())
    end
    if self.direction == "d" then
        self.character_sprite = love.graphics.newQuad(0, self.skin*225, 50, 92, sprites.character:getDimensions())
    end
end

function player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.health, 5)
    love.graphics.draw(sprites.character, self.character_sprite, self.x, self.y)
end

function player:shoot()
    if self.shoot_cooldown == 0 then
        local bullet = projectile:init(self.x, self.y, self.direction)
        table.insert(projectiles, bullet)
        self.shoot_cooldown = 15
    end
end

function player:getItems()
    return self.items
end

function player:dig()
    self.world:destroyBlockAt(self.x, self.y)
end

function player:hit()
    local nearby = self:getNearbyPlayers(10)
    print(nearby)
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
    self.health = health
end

function player:getNearbyPlayers(radius)
    local nearby = {}
    local mX, pX = self.x - radius, self.x + radius
    local mY, pY = self.y - radius, self.y + radius

    for i=1,table.getn(all_players) do
        local networkPlayer = all_players[i]
        if networkPlayer.x >= mX and networkPlayer.x <= pX and networkPlayer.y >= mY and networkPlayer.y <= pY then
            table.insert(nearby, networkPlayer)
        end
    end
    return nearby
end

