function newItem(xPos, yPos)
    local item = {}
    item.sprite = getSprite(sprites.items, xPos*16, yPos*16, 16, 16)
    return item 
end

item_pickaxe = newItem(5, 6)
item_spade = newItem(5, 12)
item_staff = newItem(4, 11)
