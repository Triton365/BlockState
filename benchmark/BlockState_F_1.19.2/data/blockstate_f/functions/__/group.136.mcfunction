execute if block ~ ~ ~ iron_door run function blockstate_f:__/block.iron_door
execute if block ~ ~ ~ iron_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:iron_ore"}
execute if block ~ ~ ~ iron_trapdoor run function blockstate_f:__/block.iron_trapdoor
execute if block ~ ~ ~ jack_o_lantern run function blockstate_f:__/block.jack_o_lantern