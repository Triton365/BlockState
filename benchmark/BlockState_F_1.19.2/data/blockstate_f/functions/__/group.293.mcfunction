execute if block ~ ~ ~ torch run data modify storage blockstate_f: BlockState set value {Name:"minecraft:torch"}
execute if block ~ ~ ~ trapped_chest run function blockstate_f:__/block.trapped_chest
execute if block ~ ~ ~ tripwire run function blockstate_f:__/block.tripwire
execute if block ~ ~ ~ tripwire_hook run function blockstate_f:__/block.tripwire_hook