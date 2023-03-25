data modify storage blockstate_f: BlockState set value {Name:"minecraft:snow",Properties:{layers:"1"}}
execute if block ~ ~ ~ #blockstate_f:all[layers=2] run data modify storage blockstate_f: BlockState.Properties.layers set value "2"
execute if predicate blockstate_f:state.layers.3..5 run function blockstate_f:__/state.layers.3.4.5
execute if predicate blockstate_f:state.layers.6..8 run function blockstate_f:__/state.layers.6.7.8