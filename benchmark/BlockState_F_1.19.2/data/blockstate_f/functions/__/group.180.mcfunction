execute if block ~ ~ ~ mossy_stone_brick_wall run function blockstate_f:__/block.mossy_stone_brick_wall
execute if block ~ ~ ~ mossy_stone_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:mossy_stone_bricks"}
execute if block ~ ~ ~ moving_piston run function blockstate_f:__/block.moving_piston
execute if block ~ ~ ~ mud run data modify storage blockstate_f: BlockState set value {Name:"minecraft:mud"}