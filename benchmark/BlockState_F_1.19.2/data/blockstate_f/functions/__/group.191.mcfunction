execute if block ~ ~ ~ oak_planks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:oak_planks"}
execute if block ~ ~ ~ oak_pressure_plate run function blockstate_f:__/block.oak_pressure_plate
execute if block ~ ~ ~ oak_sapling run function blockstate_f:__/block.oak_sapling
execute if block ~ ~ ~ oak_sign run function blockstate_f:__/block.oak_sign