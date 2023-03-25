data modify storage blockstate_f: BlockState set value {Name:"minecraft:twisting_vines",Properties:{age:"0"}}
execute if predicate blockstate_f:state.age.1..5 run function blockstate_f:__/state.age.1.2.3.4.5
execute if predicate blockstate_f:state.age.6..10 run function blockstate_f:__/state.age.6.7.8.9.10
execute if predicate blockstate_f:state.age.11..15 run function blockstate_f:__/state.age.11.12.13.14.15
execute if predicate blockstate_f:state.age.16..20 run function blockstate_f:__/state.age.16.17.18.19.20
execute if predicate blockstate_f:state.age.21..25 run function blockstate_f:__/state.age.21.22.23.24.25