function getSprite(image, x, y, width, height)
    return love.graphics.newQuad(x, y, width, height, image:getDimensions())
end
