execute if block ~ ~ ~ stone_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:stone_bricks"}
execute if block ~ ~ ~ stone_button run function blockstate_f:__/block.stone_button
execute if block ~ ~ ~ stone_pressure_plate run function blockstate_f:__/block.stone_pressure_plate
execute if block ~ ~ ~ stone_slab run function blockstate_f:__/block.stone_slab