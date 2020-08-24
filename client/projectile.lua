projectile = {}
local speed = 15

function projectile:init(startX, startY, direction)
    o = {}
    o.startX = startX
    o.startY = startY
    o.x = startX
    o.y = startY
    o.direction = direction
    return o
end

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
end

function projectile:collide()
end

function projectile:draw()
    love.graphics.rectangle("fill", self.x, self.y, 8, 8)
end
