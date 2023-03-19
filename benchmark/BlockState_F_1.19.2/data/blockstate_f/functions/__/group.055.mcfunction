execute if block ~ ~ ~ coarse_dirt run data modify storage blockstate_f: BlockState set value {Name:"minecraft:coarse_dirt"}
execute if block ~ ~ ~ cobbled_deepslate run data modify storage blockstate_f: BlockState set value {Name:"minecraft:cobbled_deepslate"}
execute if block ~ ~ ~ cobbled_deepslate_slab run function blockstate_f:__/block.cobbled_deepslate_slab
execute if block ~ ~ ~ cobbled_deepslate_stairs run function blockstate_f:__/block.cobbled_deepslate_stairs