execute if block ~ ~ ~ glass run data modify storage blockstate_f: BlockState set value {Name:"minecraft:glass"}
execute if block ~ ~ ~ glass_pane run function blockstate_f:__/block.glass_pane
execute if block ~ ~ ~ glow_lichen run function blockstate_f:__/block.glow_lichen
execute if block ~ ~ ~ glowstone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:glowstone"}