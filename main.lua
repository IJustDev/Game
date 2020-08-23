require "spritesheets"
require "spritehelper"
require "entitymanager"
require "projectile"
require "item"
require "player"
require "hud"
require "block"
require "map"
require "world"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    local initializedWorld = world:generate({})
    map:init(initializedWorld)
    player:init(m)
    hud:init(player)
end

function love.draw()
    map:draw()
    player:draw()
    hud:draw()
    entitymanager:draw()
end

function love.update()
    player:update()
    entitymanager:update()
    hud:update(player)
end

function love.keypressed(key, scancode, isrepeat)
    player.keypressed(key, scancode, isrepeat)
end
