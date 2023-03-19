execute if block ~ ~ ~ farmland run function blockstate_f:__/block.farmland
execute if block ~ ~ ~ fern run data modify storage blockstate_f: BlockState set value {Name:"minecraft:fern"}
execute if block ~ ~ ~ fire run function blockstate_f:__/block.fire
execute if block ~ ~ ~ fire_coral run function blockstate_f:__/block.fire_coral