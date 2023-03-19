data modify storage blockstate_f: BlockState set value {Name:"minecraft:wheat"}
execute if predicate blockstate_f:state.age.0..1 run function blockstate_f:__/state.age.0.1
execute if predicate blockstate_f:state.age.2..4 run function blockstate_f:__/state.age.2.3.4
execute if predicate blockstate_f:state.age.5..7 run function blockstate_f:__/state.age.5.6.7