block_grass = {}
item_grass = {}

function item_grass:new()
    return item:new("grass", 4, 7)
end

function block_grass:new()
    return block:new(true, 2, 2, item_grass:new())
end

