block_grass = {}
block_crafting_table = {}

item_arrow = item:new("d:arrow", sprites.items.arrow)
item_emerald = item:new("d:emerald", sprites.items.emerald)
item_diamond = item:new("d:diamond", sprites.items.diamond)

function block_grass:new()
    return block:new(true, sprites.blocks.wood, 2, item_emerald)
end

function block_crafting_table:new()
    return block:new(true, sprites.blocks.crafting_table, 1, item_diamond)
end
