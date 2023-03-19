execute if block ~ ~ ~ waxed_weathered_cut_copper_stairs run function blockstate_f:__/block.waxed_weathered_cut_copper_stairs
execute if block ~ ~ ~ weathered_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:weathered_copper"}
execute if block ~ ~ ~ weathered_cut_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:weathered_cut_copper"}
execute if block ~ ~ ~ weathered_cut_copper_slab run function blockstate_f:__/block.weathered_cut_copper_slab