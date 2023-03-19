execute if block ~ ~ ~ nether_gold_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_gold_ore"}
execute if block ~ ~ ~ nether_portal run function blockstate_f:__/block.nether_portal
execute if block ~ ~ ~ nether_quartz_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_quartz_ore"}
execute if block ~ ~ ~ nether_sprouts run data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_sprouts"}