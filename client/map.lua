map = {}

function map:init(world)
    self.world = world
end

function map:draw()
    local tileMap = self.world:getTileMap()
    for i=0,150 do
        for j=0,150 do
            local b = tileMap[i][j]
            if b ~= nil then
                love.graphics.draw(sprites.images.tileset, b:getSprite(), i*64, j*64)
            end
        end
    end
end

function map:removeBlock(x, y)
end

function map:update()
end
