all_projectiles = {}

projectile = {}

local speed = 15

function projectile:new(startX, startY, direction, shooter)
    o = {}
    o.startX = startX
    o.startY = startY
    o.x = startX
    o.y = startY
    o.direction = direction
    o.shooter = shooter
    self.__index = self
    setmetatable(o, self)
    table.insert(all_projectiles, o)
    return o
end

local ticksAlive = 0
function projectile:update()
    if self.direction == "w" then
        self.y = self.y - speed
    elseif self.direction == "s" then
        self.y = self.y + speed
    elseif self.direction == "d" then
        self.x = self.x + speed
    elseif self.direction == "a" then
        self.x = self.x - speed
    end
    ticksAlive = ticksAlive + 1
    if ticksAlive == 15 then
        self:destroy()
    end
    self:didCollide()
end

function projectile:didCollide()
    local nearby = self:getNearbyPlayers(32)
    if table.getn(nearby) > 0 then
        local target = nearby[1]
        if target ~= o.shooter then
            self:destroy()
            target:damage(4)
            if target.isDead then
                self.shooter:addMoney(420)
            end
        end
    end
end

function projectile:destroy()
    table.remove(all_projectiles, indexOf(all_projectiles, self))
end

function projectile:getNearbyPlayers(radius)
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

function projectile:draw()
    love.graphics.rectangle("fill", self.x, self.y, 8, 8)
end

function projectile:updateAll()
    for i=1,table.getn(all_projectiles) do
        local proj = all_projectiles[i]
        proj:update()
    end
end

function projectile:drawAll()
    for i=1,table.getn(all_projectiles) do
        local proj = all_projectiles[i]
        proj:draw()
    end
end
