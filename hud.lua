hud = {}

function hud:init(player)
    self.player = player
    self.selected = 0
end

function hud:draw()
    -- love.graphics.rectangle("line", 20, 20, 300, 50)
    local items = self.player:getItems()
    for i=1,table.getn(items) do
        love.graphics.push()
        love.graphics.scale(3, 3)
        love.graphics.draw(sprites.items, items[i].sprite, 5 + i*20, 5)
        love.graphics.pop()
    end
end

function hud:update(player)
    self.player = player
end
