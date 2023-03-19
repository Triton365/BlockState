data modify storage blockstate_f: BlockState set value {Name:"minecraft:spruce_sign"}
execute if predicate blockstate_f:state.rotation.0..3 run function blockstate_f:__/state.rotation.0.1.2.3
execute if predicate blockstate_f:state.rotation.4..7 run function blockstate_f:__/state.rotation.4.5.6.7
execute if predicate blockstate_f:state.rotation.8..11 run function blockstate_f:__/state.rotation.8.9.10.11
execute if predicate blockstate_f:state.rotation.12..15 run function blockstate_f:__/state.rotation.12.13.14.15
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"