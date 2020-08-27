block_grass = {}
block_crafting_table = {}

item_arrow = item:new("i:arrow", sprites.items.arrow)
item_emerald = item:new("i:emerald", sprites.items.emerald)
item_diamond = item:new("i:diamond", sprites.items.diamond)
item_coal = item:new("i:coal", sprites.items.coal)

block_stone = block:new("b:stone", true, sprites.blocks.stone, -1, item_emerald, nil)
block_wood = block:new("b:wood", true, sprites.blocks.wood, -1, item_emerald, nil)
block_ore_coal = block:new("b:ore_coal", true, sprites.blocks.coal, 1, item_coal, block_stone)
block_ore_diamond = block:new("b:ore_diamond", true, sprites.blocks.diamond, 3, item_diamond, block_stone)
block_crafting_table = block:new("b:crafting_table", true, sprites.blocks.crafting_table, 1, item_diamond, block_stone)
