execute if block ~ ~ ~ cobblestone_wall run function blockstate_f:__/block.cobblestone_wall
execute if block ~ ~ ~ cobweb run data modify storage blockstate_f: BlockState set value {Name:"minecraft:cobweb"}
execute if block ~ ~ ~ cocoa run function blockstate_f:__/block.cocoa
execute if block ~ ~ ~ command_block run function blockstate_f:__/block.command_block