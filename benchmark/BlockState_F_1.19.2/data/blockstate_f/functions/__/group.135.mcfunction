execute if block ~ ~ ~ infested_stone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:infested_stone"}
execute if block ~ ~ ~ infested_stone_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:infested_stone_bricks"}
execute if block ~ ~ ~ iron_bars run function blockstate_f:__/block.iron_bars
execute if block ~ ~ ~ iron_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:iron_block"}