execute if block ~ ~ ~ respawn_anchor run function blockstate_f:__/block.respawn_anchor
execute if block ~ ~ ~ rooted_dirt run data modify storage blockstate_f: BlockState set value {Name:"minecraft:rooted_dirt"}
execute if block ~ ~ ~ rose_bush run function blockstate_f:__/block.rose_bush
execute if block ~ ~ ~ sand run data modify storage blockstate_f: BlockState set value {Name:"minecraft:sand"}