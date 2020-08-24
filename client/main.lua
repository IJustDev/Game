all_players = {}
require "utils"
require "net/networking"
require "spritesheets"
require "spritehelper"
require "entitymanager"
require "projectile"
require "item"
require "player"
require "localplayer"
require "networkplayer"
require "hud"
require "block"
require "blocks/grass"
require "map"
require "world"
require "enemy"

enemies = {}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    local initializedWorld = world:generate({})
    networking:establish()
    map:init(initializedWorld)

    nwPlayer = networkplayer:init(2003, "Asdf")
    gamePlayer = localplayer:init(networking, initializedWorld)
    hud:init(gamePlayer)
end

function love.draw()
    -- love.graphics.push()
    -- love.graphics.scale(1.25, 1.25)
    map:draw()

    networking:draw()
    entitymanager:draw()

    gamePlayer:draw()
    nwPlayer:draw()
    hud:draw()
    -- love.graphics.pop()
end

function love.update(dt)
    gamePlayer:update(dt)
    nwPlayer:update(dt)
    entitymanager:update()
    hud:update(gamePlayer)
    networking:update(dt)
end

function love.keypressed(key, scancode, isrepeat)
    gamePlayer:keypressed(key, scancode, isrepeat)
    hud:keypressed(key, scancode, isrepeat)
end
