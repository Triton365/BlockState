data modify storage blockstate_f: BlockState set value {Name:"minecraft:cactus",Properties:{age:"0"}}
execute if predicate blockstate_f:state.age.1..3 run function blockstate_f:__/state.age.1.2.3
execute if predicate blockstate_f:state.age.4..7 run function blockstate_f:__/state.age.4.5.6.7
execute if predicate blockstate_f:state.age.8..11 run function blockstate_f:__/state.age.8.9.10.11
execute if predicate blockstate_f:state.age.12..15 run function blockstate_f:__/state.age.12.13.14.15