data modify storage blockstate_f: BlockState set value {Name:"minecraft:chorus_flower"}
execute if block ~ ~ ~ #blockstate_f:all[age=0] run data modify storage blockstate_f: BlockState.Properties.age set value "0"
execute if block ~ ~ ~ #blockstate_f:all[age=1] run data modify storage blockstate_f: BlockState.Properties.age set value "1"
execute if block ~ ~ ~ #blockstate_f:all[age=2] run data modify storage blockstate_f: BlockState.Properties.age set value "2"
execute if block ~ ~ ~ #blockstate_f:all[age=3] run data modify storage blockstate_f: BlockState.Properties.age set value "3"
execute if block ~ ~ ~ #blockstate_f:all[age=4] run data modify storage blockstate_f: BlockState.Properties.age set value "4"
execute if block ~ ~ ~ #blockstate_f:all[age=5] run data modify storage blockstate_f: BlockState.Properties.age set value "5"