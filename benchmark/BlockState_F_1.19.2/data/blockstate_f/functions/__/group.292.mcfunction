execute if block ~ ~ ~ target run function blockstate_f:__/block.target
execute if block ~ ~ ~ terracotta run data modify storage blockstate_f: BlockState set value {Name:"minecraft:terracotta"}
execute if block ~ ~ ~ tinted_glass run data modify storage blockstate_f: BlockState set value {Name:"minecraft:tinted_glass"}
execute if block ~ ~ ~ tnt run function blockstate_f:__/block.tnt