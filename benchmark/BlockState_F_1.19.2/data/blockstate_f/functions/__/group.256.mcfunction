execute if block ~ ~ ~ redstone_wire run function blockstate_f:__/block.redstone_wire
execute if block ~ ~ ~ reinforced_deepslate run data modify storage blockstate_f: BlockState set value {Name:"minecraft:reinforced_deepslate"}
execute if block ~ ~ ~ repeater run function blockstate_f:__/block.repeater
execute if block ~ ~ ~ repeating_command_block run function blockstate_f:__/block.repeating_command_block