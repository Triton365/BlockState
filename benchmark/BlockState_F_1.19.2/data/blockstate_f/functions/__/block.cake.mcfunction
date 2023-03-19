data modify storage blockstate_f: BlockState set value {Name:"minecraft:cake"}
execute if block ~ ~ ~ #blockstate_f:all[bites=0] run data modify storage blockstate_f: BlockState.Properties.bites set value "0"
execute if predicate blockstate_f:state.bites.1..3 run function blockstate_f:__/state.bites.1.2.3
execute if predicate blockstate_f:state.bites.4..6 run function blockstate_f:__/state.bites.4.5.6