all_players = {}
require "utils"
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
require "map"
require "world"
require "enemy"

enemies = {}

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    local initializedWorld = world:init(200, 200)
    world:generate()
    math.randomseed(os.time())
    entityId = tostring(math.random(9999))
    map:init(initializedWorld)

    local net = networking
    net:establish(entityId)
    gamePlayer = localplayer:init(net, entity, initializedWorld)
    hud:init(gamePlayer)
end

function love.draw()
    love.graphics.push()
    love.graphics.translate(-gamePlayer.x+((love.graphics.getWidth()-50) / 2), -gamePlayer.y+((love.graphics.getHeight() - 90) / 2))

    map:draw()
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
end

function love.keypressed(key, scancode, isrepeat)
    gamePlayer:keypressed(key, scancode, isrepeat)
    hud:keypressed(key, scancode, isrepeat)
end
