execute if block ~ ~ ~ scaffolding run function blockstate_f:__/block.scaffolding
execute if block ~ ~ ~ sculk run data modify storage blockstate_f: BlockState set value {Name:"minecraft:sculk"}
execute if block ~ ~ ~ sculk_catalyst run function blockstate_f:__/block.sculk_catalyst
execute if block ~ ~ ~ sculk_sensor run function blockstate_f:__/block.sculk_sensor