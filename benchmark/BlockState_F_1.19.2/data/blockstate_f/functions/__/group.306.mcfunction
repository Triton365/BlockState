execute if block ~ ~ ~ waxed_copper_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:waxed_copper_block"}
execute if block ~ ~ ~ waxed_cut_copper run data modify storage blockstate_f: BlockState set value {Name:"minecraft:waxed_cut_copper"}
execute if block ~ ~ ~ waxed_cut_copper_slab run function blockstate_f:__/block.waxed_cut_copper_slab
execute if block ~ ~ ~ waxed_cut_copper_stairs run function blockstate_f:__/block.waxed_cut_copper_stairs