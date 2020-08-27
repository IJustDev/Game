all_players = {}
anim8 = require "anim8"
require "utils"
require "gamestate"
require "net/networking"
require "spritesheets"
require "entitymanager"
require "projectile"
require "item"
require "player"
require "localplayer"
require "networkplayer"
require "hud"
require "block"
require "objectregistry"
require "chunk"
require "world"
require "enemy"

enemies = {}

worldInitialized = false

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    entityId = tostring(math.random(9999))

    local net = networking
    net:establish(entityId)

    initializedWorld = world:init()

    gamePlayer = localplayer:init(net, entity, initializedWorld)
    hud:init(gamePlayer)
end

function love.draw()
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

function love.update(dt)
    gamePlayer:update(dt)
    entitymanager:update()
    hud:update(gamePlayer)
    networking:update(dt)
    projectile:updateAll()
    networkplayer:updateAll(dt)
end

function love.keypressed(key, scancode, isrepeat)
    gamePlayer:keypressed(key, scancode, isrepeat)
    hud:keypressed(key, scancode, isrepeat)
end
