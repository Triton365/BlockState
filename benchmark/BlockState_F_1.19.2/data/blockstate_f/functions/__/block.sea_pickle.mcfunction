data modify storage blockstate_f: BlockState set value {Name:"minecraft:sea_pickle"}
execute if block ~ ~ ~ #blockstate_f:all[pickles=1] run data modify storage blockstate_f: BlockState.Properties.pickles set value "1"
execute if block ~ ~ ~ #blockstate_f:all[pickles=2] run data modify storage blockstate_f: BlockState.Properties.pickles set value "2"
execute if block ~ ~ ~ #blockstate_f:all[pickles=3] run data modify storage blockstate_f: BlockState.Properties.pickles set value "3"
execute if block ~ ~ ~ #blockstate_f:all[pickles=4] run data modify storage blockstate_f: BlockState.Properties.pickles set value "4"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"