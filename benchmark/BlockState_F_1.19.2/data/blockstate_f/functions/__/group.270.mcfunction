execute if block ~ ~ ~ smooth_stone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:smooth_stone"}
execute if block ~ ~ ~ smooth_stone_slab run function blockstate_f:__/block.smooth_stone_slab
execute if block ~ ~ ~ snow run function blockstate_f:__/block.snow