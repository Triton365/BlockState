execute if block ~ ~ ~ diamond_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:diamond_ore"}
execute if block ~ ~ ~ diorite run data modify storage blockstate_f: BlockState set value {Name:"minecraft:diorite"}
execute if block ~ ~ ~ diorite_slab run function blockstate_f:__/block.diorite_slab
execute if block ~ ~ ~ diorite_stairs run function blockstate_f:__/block.diorite_stairs