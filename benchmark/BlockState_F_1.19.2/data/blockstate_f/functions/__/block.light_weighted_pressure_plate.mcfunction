data modify storage blockstate_f: BlockState set value {Name:"minecraft:light_weighted_pressure_plate"}
execute if predicate blockstate_f:state.power.0..3 run function blockstate_f:__/state.power.0.1.2.3
execute if predicate blockstate_f:state.power.4..7 run function blockstate_f:__/state.power.4.5.6.7
execute if predicate blockstate_f:state.power.8..11 run function blockstate_f:__/state.power.8.9.10.11
execute if predicate blockstate_f:state.power.12..15 run function blockstate_f:__/state.power.12.13.14.15