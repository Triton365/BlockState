data modify storage blockstate_f: BlockState set value {Name:"minecraft:dark_oak_leaves"}
execute if block ~ ~ ~ #blockstate_f:all[distance=1] run data modify storage blockstate_f: BlockState.Properties.distance set value "1"
execute if predicate blockstate_f:state.distance.2..4 run function blockstate_f:__/state.distance.2.3.4
execute if predicate blockstate_f:state.distance.5..7 run function blockstate_f:__/state.distance.5.6.7
execute if block ~ ~ ~ #blockstate_f:all[persistent=false] run data modify storage blockstate_f: BlockState.Properties.persistent set value "false"
execute if block ~ ~ ~ #blockstate_f:all[persistent=true] run data modify storage blockstate_f: BlockState.Properties.persistent set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"