execute if block ~ ~ ~ deepslate_tile_wall run function blockstate_f:__/block.deepslate_tile_wall
execute if block ~ ~ ~ deepslate_tiles run data modify storage blockstate_f: BlockState set value {Name:"minecraft:deepslate_tiles"}
execute if block ~ ~ ~ detector_rail run function blockstate_f:__/block.detector_rail
execute if block ~ ~ ~ diamond_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:diamond_block"}