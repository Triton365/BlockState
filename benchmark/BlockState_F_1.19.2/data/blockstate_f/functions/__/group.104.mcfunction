execute if block ~ ~ ~ dripstone_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dripstone_block"}
execute if block ~ ~ ~ dropper run function blockstate_f:__/block.dropper
execute if block ~ ~ ~ emerald_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:emerald_block"}
execute if block ~ ~ ~ emerald_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:emerald_ore"}