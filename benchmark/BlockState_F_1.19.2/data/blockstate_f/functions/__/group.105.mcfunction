execute if block ~ ~ ~ enchanting_table run data modify storage blockstate_f: BlockState set value {Name:"minecraft:enchanting_table"}
execute if block ~ ~ ~ end_gateway run data modify storage blockstate_f: BlockState set value {Name:"minecraft:end_gateway"}
execute if block ~ ~ ~ end_portal run data modify storage blockstate_f: BlockState set value {Name:"minecraft:end_portal"}
execute if block ~ ~ ~ end_portal_frame run function blockstate_f:__/block.end_portal_frame