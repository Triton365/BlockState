data modify storage blockstate_f: BlockState set value {Name:"minecraft:mangrove_propagule",Properties:{age:"0",hanging:"false",stage:"0",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[age=1] run data modify storage blockstate_f: BlockState.Properties.age set value "1"
execute if block ~ ~ ~ #blockstate_f:all[age=2] run data modify storage blockstate_f: BlockState.Properties.age set value "2"
execute if block ~ ~ ~ #blockstate_f:all[age=3] run data modify storage blockstate_f: BlockState.Properties.age set value "3"
execute if block ~ ~ ~ #blockstate_f:all[age=4] run data modify storage blockstate_f: BlockState.Properties.age set value "4"
execute if block ~ ~ ~ #blockstate_f:all[hanging=true] run data modify storage blockstate_f: BlockState.Properties.hanging set value "true"
execute if block ~ ~ ~ #blockstate_f:all[stage=1] run data modify storage blockstate_f: BlockState.Properties.stage set value "1"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"