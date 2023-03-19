execute if block ~ ~ ~ crimson_roots run data modify storage blockstate_f: BlockState set value {Name:"minecraft:crimson_roots"}
execute if block ~ ~ ~ crimson_sign run function blockstate_f:__/block.crimson_sign
execute if block ~ ~ ~ crimson_slab run function blockstate_f:__/block.crimson_slab
execute if block ~ ~ ~ crimson_stairs run function blockstate_f:__/block.crimson_stairs