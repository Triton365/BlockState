data modify storage blockstate_f: BlockState set value {Name:"minecraft:azalea_leaves",Properties:{distance:"1",persistent:"false",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[distance=2] run data modify storage blockstate_f: BlockState.Properties.distance set value "2"
execute if block ~ ~ ~ #blockstate_f:all[distance=3] run data modify storage blockstate_f: BlockState.Properties.distance set value "3"
execute if block ~ ~ ~ #blockstate_f:all[distance=4] run data modify storage blockstate_f: BlockState.Properties.distance set value "4"
execute if block ~ ~ ~ #blockstate_f:all[distance=5] run data modify storage blockstate_f: BlockState.Properties.distance set value "5"
execute if block ~ ~ ~ #blockstate_f:all[distance=6] run data modify storage blockstate_f: BlockState.Properties.distance set value "6"
execute if block ~ ~ ~ #blockstate_f:all[distance=7] run data modify storage blockstate_f: BlockState.Properties.distance set value "7"
execute if block ~ ~ ~ #blockstate_f:all[persistent=true] run data modify storage blockstate_f: BlockState.Properties.persistent set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"