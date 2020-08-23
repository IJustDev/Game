all_players = {}
require "utils"
require "net/networking"
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
    networking:establish()
    map:init(initializedWorld)
    player:init(networking)
    hud:init(player)
end

function love.draw()
    map:draw()

    networking:draw()
    entitymanager:draw()

    player:draw()
    hud:draw()
end

function love.update(dt)
    player:update(dt)
    entitymanager:update()
    hud:update(player)
    networking:update(dt)
end

function love.keypressed(key, scancode, isrepeat)
    player.keypressed(key, scancode, isrepeat)
    hud:keypressed(key, scancode, isrepeat)
end
