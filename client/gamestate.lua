GameStateManager = {}

gamestate = {}

-- o.state = the current gamestate.
-- 0 stands for title screen
-- 1 stands for ingame
function gamestate:init()
    self.state = 0
end

function gamestate:draw()
    if self.state == 0 then
        self:drawTitleScreen()
    elseif self.state == 1 then
        self:drawInGame(dt)
    end
end

function gamestate:update(dt)
    if self.state == 0 then
        self:updateTitleScreen()
    elseif self.state == 1 then
        self:updateInGame(dt)
    end
end

function gamestate:getCurrentGameState()
    return self.state
end

function gamestate:updateInGame(dt)
    gamePlayer:update(dt)
    entitymanager:update()
    hud:update(gamePlayer)
    networking:update(dt)
    projectile:updateAll()
    networkplayer:updateAll(dt)
end

function gamestate:keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    if self.state == 0 then
        if key == "space" then
            self.state = 1
        end
    elseif self.state == 1 then
        gamePlayer:keypressed(key, scancode, isrepeat)
        hud:keypressed(key, scancode, isrepeat)
    end
end

function gamestate:drawInGame()
    love.graphics.push()
    love.graphics.translate(-gamePlayer.x+((love.graphics.getWidth()-50) / 2), -gamePlayer.y+((love.graphics.getHeight() - 90) / 2))
    if worldInitialized then
        initializedWorld:draw(gamePlayer)
    end
    entitymanager:draw()

    networkplayer:drawAll()
    projectile:drawAll()
    gamePlayer:draw()

    love.graphics.pop()
    hud:draw()
end

function gamestate:updateTitleScreen()

end

function gamestate:textinput(t)
end

function gamestate:drawTitleScreen()
    love.graphics.print("Minecraft für Arme")
    love.graphics.print("Smash Space to begin", 30, 30)
end
