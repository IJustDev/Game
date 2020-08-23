hud = {}

function hud:init(player)
    self.player = player
    self.selected = 1
end

function hud:keypressed(key, scancode, isrepeat)
    if key == "1" then
        self.selected = 1
    elseif key == "2" then
        self.selected = 2
    end
end

function hud:draw()
    local items = self.player:getItems()
    for i=1,table.getn(items) do
        love.graphics.push()
        -- love.graphics.scale(4, 4)
        love.graphics.draw(sprites.items, items[i].sprite, i*20, love.graphics.getHeight() - 40)
        if self.selected == i then
            love.graphics.rectangle("line", i*20, love.graphics.getHeight() - 40, 16, 16)
        end
        love.graphics.pop()
    end
end

function hud:update(player)
    self.player = player
end
