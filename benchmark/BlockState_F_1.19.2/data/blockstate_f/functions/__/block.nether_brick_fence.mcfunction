data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_brick_fence"}
execute if block ~ ~ ~ #blockstate_f:all[east=false] run data modify storage blockstate_f: BlockState.Properties.east set value "false"
execute if block ~ ~ ~ #blockstate_f:all[east=true] run data modify storage blockstate_f: BlockState.Properties.east set value "true"
execute if block ~ ~ ~ #blockstate_f:all[north=false] run data modify storage blockstate_f: BlockState.Properties.north set value "false"
execute if block ~ ~ ~ #blockstate_f:all[north=true] run data modify storage blockstate_f: BlockState.Properties.north set value "true"
execute if block ~ ~ ~ #blockstate_f:all[south=false] run data modify storage blockstate_f: BlockState.Properties.south set value "false"
execute if block ~ ~ ~ #blockstate_f:all[south=true] run data modify storage blockstate_f: BlockState.Properties.south set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=false] run data modify storage blockstate_f: BlockState.Properties.west set value "false"
execute if block ~ ~ ~ #blockstate_f:all[west=true] run data modify storage blockstate_f: BlockState.Properties.west set value "true"