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
require "gamestate"

enemies = {}

worldInitialized = false

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    entityId = tostring(math.random(9999))

    local net = networking
    net:establish(entityId)

    gamestate:init()

    initializedWorld = world:init()

    gamePlayer = localplayer:init(net, entity, initializedWorld)
    hud:init(gamePlayer)
end

function love.draw()
    gamestate:draw()
end

function love.update(dt)
    gamestate:update(dt)
end

function love.keypressed(key, scancode, isrepeat)
    gamestate:keypressed(key, scancode, isrepeat)
end

function love.textinput(t)
    gamestate:textinput(t)
end
