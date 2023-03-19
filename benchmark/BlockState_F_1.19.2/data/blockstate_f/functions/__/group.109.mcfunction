execute if block ~ ~ ~ exposed_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:exposed_copper"}
execute if block ~ ~ ~ exposed_cut_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:exposed_cut_copper"}
execute if block ~ ~ ~ exposed_cut_copper_slab run function blockstate_f:__/block.exposed_cut_copper_slab
execute if block ~ ~ ~ exposed_cut_copper_stairs run function blockstate_f:__/block.exposed_cut_copper_stairs