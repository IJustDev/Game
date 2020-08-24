enemy = {}

function enemy:init(x, y)
    o = {}
    o.health = 20
    o.x = x
    o.y = y
    o.speed = 2
    return o
end

function enemy:setHealth(health)
    enemy.health = health
end

function enemy:draw()
    love.graphics.rectangle("fill", self.x, self.y, 50, 50)
end

local directionToggleTimer = 0
local direction = 1
function enemy:update(dt)
    directionToggleTimer = directionToggleTimer + dt
    if directionToggleTimer > 4 then
        directionToggleTimer = directionToggleTimer - 4
        direction = not direction
    end
    if direction then
        self.x = self.x + self.speed
    else
        self.x = self.x - self.speed
    end
end
