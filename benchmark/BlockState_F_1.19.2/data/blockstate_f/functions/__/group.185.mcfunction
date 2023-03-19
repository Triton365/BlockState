execute if block ~ ~ ~ nether_brick_slab run function blockstate_f:__/block.nether_brick_slab
execute if block ~ ~ ~ nether_brick_stairs run function blockstate_f:__/block.nether_brick_stairs
execute if block ~ ~ ~ nether_brick_wall run function blockstate_f:__/block.nether_brick_wall
execute if block ~ ~ ~ nether_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_bricks"}