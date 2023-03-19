execute if block ~ ~ ~ end_stone_brick_wall run function blockstate_f:__/block.end_stone_brick_wall
execute if block ~ ~ ~ end_stone_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:end_stone_bricks"}
execute if block ~ ~ ~ ender_chest run function blockstate_f:__/block.ender_chest