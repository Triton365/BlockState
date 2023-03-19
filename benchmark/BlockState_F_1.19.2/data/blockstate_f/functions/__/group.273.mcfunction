execute if block ~ ~ ~ spawner run data modify storage blockstate_f: BlockState set value {Name:"minecraft:spawner"}
execute if block ~ ~ ~ sponge run data modify storage blockstate_f: BlockState set value {Name:"minecraft:sponge"}
execute if block ~ ~ ~ spore_blossom run data modify storage blockstate_f: BlockState set value {Name:"minecraft:spore_blossom"}
execute if block ~ ~ ~ spruce_button run function blockstate_f:__/block.spruce_button