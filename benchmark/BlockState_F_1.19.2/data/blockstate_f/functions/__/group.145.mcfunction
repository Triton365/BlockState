execute if block ~ ~ ~ lantern run function blockstate_f:__/block.lantern
execute if block ~ ~ ~ lapis_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:lapis_block"}
execute if block ~ ~ ~ lapis_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:lapis_ore"}
execute if block ~ ~ ~ large_amethyst_bud run function blockstate_f:__/block.large_amethyst_bud