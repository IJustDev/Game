map = {}

function map:init(world)
    self.grassSprite = getSprite(sprites.floor, 0, 2*32, 32, 32)
    self.stoneSprite = getSprite(sprites.floor, 0, 0, 32, 32)
    self.world = world
end

function map:draw()
    local tileMap = self.world:getTileMap()
    for i=0,150 do
        for j=0,150 do
            local b = tileMap[i][j]
            if b ~= nil then
                love.graphics.draw(sprites.floor, b:getSprite(), i*32, j*32)
            end
        end
    end
end

function map:removeBlock(x, y)
end

function map:update()
end
