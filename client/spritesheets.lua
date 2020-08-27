function getSprite(image, spriteX, spriteY, spriteWidth, spriteHeight)
    return love.graphics.newQuad(spriteX * spriteWidth, spriteY * spriteHeight, spriteWidth, spriteHeight, image:getDimensions())
end

sprites = {}
sprites.images = {}
sprites.images.character = love.graphics.newImage("sprites/character.png")
sprites.images.tileset = love.graphics.newImage("sprites/tileset.png")
sprites.images.items = love.graphics.newImage("sprites/items.png")

sprites.blocks = {}
sprites.blocks.stone = getSprite(sprites.images.tileset, 0, 0, 64, 64)
sprites.blocks.wood = getSprite(sprites.images.tileset, 0, 2, 64, 64)
sprites.blocks.coal = getSprite(sprites.images.tileset, 2, 2, 64, 64)
sprites.blocks.diamond = getSprite(sprites.images.tileset, 2, 0, 64, 64)

sprites.blocks.crafting_table = getSprite(sprites.images.tileset, 1, 3, 64, 64)

sprites.items = {}
sprites.items.emerald = getSprite(sprites.images.items, 1, 0, 64, 64)
sprites.items.diamond = getSprite(sprites.images.items, 1, 1, 64, 64)
sprites.items.coal = getSprite(sprites.images.items, 1, 2, 64, 64)
