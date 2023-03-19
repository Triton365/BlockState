execute if block ~ ~ ~ red_sandstone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:red_sandstone"}
execute if block ~ ~ ~ red_sandstone_slab run function blockstate_f:__/block.red_sandstone_slab
execute if block ~ ~ ~ red_sandstone_stairs run function blockstate_f:__/block.red_sandstone_stairs
execute if block ~ ~ ~ red_sandstone_wall run function blockstate_f:__/block.red_sandstone_wall