local width = 32
local height = 32

function newBlock(xPos, yPos)
    block = {}
    block.sprite = getSprite(sprites.floor, xPos*width, yPos*height, width, height)
    return block
end

function renderBlock(block, xPos, yPos)
    love.graphics.draw(sprites.floor, block.sprite, xPos, yPos)
end

stone_one = newBlock(0, 0)
grass_one = newBlock(0, 2)
redstone_one = newBlock(2, 4)
water = newBlock(3, 5)
