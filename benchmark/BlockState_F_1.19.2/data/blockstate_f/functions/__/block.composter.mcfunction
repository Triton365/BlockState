data modify storage blockstate_f: BlockState set value {Name:"minecraft:composter"}
execute if predicate blockstate_f:state.level.0..2 run function blockstate_f:__/state.level.0.1.2
execute if predicate blockstate_f:state.level.3..5 run function blockstate_f:__/state.level.3.4.5
execute if predicate blockstate_f:state.level.6..8 run function blockstate_f:__/state.level.6.7.8