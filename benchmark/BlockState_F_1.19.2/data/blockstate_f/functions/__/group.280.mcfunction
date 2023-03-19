execute if block ~ ~ ~ stone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:stone"}
execute if block ~ ~ ~ stone_brick_slab run function blockstate_f:__/block.stone_brick_slab
execute if block ~ ~ ~ stone_brick_stairs run function blockstate_f:__/block.stone_brick_stairs
execute if block ~ ~ ~ stone_brick_wall run function blockstate_f:__/block.stone_brick_wall