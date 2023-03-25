data modify storage blockstate_f: BlockState set value {Name:"minecraft:farmland",Properties:{moisture:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[moisture=1] run data modify storage blockstate_f: BlockState.Properties.moisture set value "1"
execute if predicate blockstate_f:state.moisture.2..4 run function blockstate_f:__/state.moisture.2.3.4
execute if predicate blockstate_f:state.moisture.5..7 run function blockstate_f:__/state.moisture.5.6.7