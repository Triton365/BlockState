execute if block ~ ~ ~ dark_oak_leaves run function blockstate_f:__/block.dark_oak_leaves
execute if block ~ ~ ~ dark_oak_log run function blockstate_f:__/block.dark_oak_log
execute if block ~ ~ ~ dark_oak_planks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dark_oak_planks"}
execute if block ~ ~ ~ dark_oak_pressure_plate run function blockstate_f:__/block.dark_oak_pressure_plate