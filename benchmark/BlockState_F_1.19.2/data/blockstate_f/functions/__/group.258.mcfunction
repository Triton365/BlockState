execute if block ~ ~ ~ sandstone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:sandstone"}
execute if block ~ ~ ~ sandstone_slab run function blockstate_f:__/block.sandstone_slab
execute if block ~ ~ ~ sandstone_stairs run function blockstate_f:__/block.sandstone_stairs
execute if block ~ ~ ~ sandstone_wall run function blockstate_f:__/block.sandstone_wall