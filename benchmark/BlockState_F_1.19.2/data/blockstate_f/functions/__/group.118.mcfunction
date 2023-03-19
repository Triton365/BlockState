execute if block ~ ~ ~ granite_stairs run function blockstate_f:__/block.granite_stairs
execute if block ~ ~ ~ granite_wall run function blockstate_f:__/block.granite_wall
execute if block ~ ~ ~ grass run data modify storage blockstate_f: BlockState set value {Name:"minecraft:grass"}
execute if block ~ ~ ~ grass_block run function blockstate_f:__/block.grass_block