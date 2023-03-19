execute if block ~ ~ ~ cut_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:cut_copper"}
execute if block ~ ~ ~ cut_copper_slab run function blockstate_f:__/block.cut_copper_slab
execute if block ~ ~ ~ cut_copper_stairs run function blockstate_f:__/block.cut_copper_stairs
execute if block ~ ~ ~ cut_red_sandstone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:cut_red_sandstone"}