execute if block ~ ~ ~ brick_stairs run function blockstate_f:__/block.brick_stairs
execute if block ~ ~ ~ brick_wall run function blockstate_f:__/block.brick_wall
execute if block ~ ~ ~ bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:bricks"}
execute if block ~ ~ ~ brown_banner run function blockstate_f:__/block.brown_banner