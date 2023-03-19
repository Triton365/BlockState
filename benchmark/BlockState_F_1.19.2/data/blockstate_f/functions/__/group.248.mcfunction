execute if block ~ ~ ~ red_mushroom run data modify storage blockstate_f: BlockState set value {Name:"minecraft:red_mushroom"}
execute if block ~ ~ ~ red_mushroom_block run function blockstate_f:__/block.red_mushroom_block
execute if block ~ ~ ~ red_nether_brick_slab run function blockstate_f:__/block.red_nether_brick_slab
execute if block ~ ~ ~ red_nether_brick_stairs run function blockstate_f:__/block.red_nether_brick_stairs