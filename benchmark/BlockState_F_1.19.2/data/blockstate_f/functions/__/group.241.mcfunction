execute if block ~ ~ ~ quartz_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:quartz_bricks"}
execute if block ~ ~ ~ quartz_pillar run function blockstate_f:__/block.quartz_pillar
execute if block ~ ~ ~ quartz_slab run function blockstate_f:__/block.quartz_slab
execute if block ~ ~ ~ quartz_stairs run function blockstate_f:__/block.quartz_stairs