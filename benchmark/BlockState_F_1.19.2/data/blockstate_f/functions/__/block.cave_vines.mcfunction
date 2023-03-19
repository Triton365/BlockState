data modify storage blockstate_f: BlockState set value {Name:"minecraft:cave_vines"}
execute if predicate blockstate_f:state.age.0..7 run function blockstate_f:__/state.age.0.1.2.3.4.5.6.7
execute if predicate blockstate_f:state.age.8..16 run function blockstate_f:__/state.age.8.9.10.11.12.13.14.15.16
execute if predicate blockstate_f:state.age.17..25 run function blockstate_f:__/state.age.17.18.19.20.21.22.23.24.25
execute if block ~ ~ ~ #blockstate_f:all[berries=false] run data modify storage blockstate_f: BlockState.Properties.berries set value "false"
execute if block ~ ~ ~ #blockstate_f:all[berries=true] run data modify storage blockstate_f: BlockState.Properties.berries set value "true"