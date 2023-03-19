data modify storage blockstate_f: BlockState set value {Name:"minecraft:fire"}
execute if predicate blockstate_f:state.age.0..3 run function blockstate_f:__/state.age.0.1.2.3
execute if predicate blockstate_f:state.age.4..7 run function blockstate_f:__/state.age.4.5.6.7
execute if predicate blockstate_f:state.age.8..11 run function blockstate_f:__/state.age.8.9.10.11
execute if predicate blockstate_f:state.age.12..15 run function blockstate_f:__/state.age.12.13.14.15
execute if block ~ ~ ~ #blockstate_f:all[east=false] run data modify storage blockstate_f: BlockState.Properties.east set value "false"
execute if block ~ ~ ~ #blockstate_f:all[east=true] run data modify storage blockstate_f: BlockState.Properties.east set value "true"
execute if block ~ ~ ~ #blockstate_f:all[north=false] run data modify storage blockstate_f: BlockState.Properties.north set value "false"
execute if block ~ ~ ~ #blockstate_f:all[north=true] run data modify storage blockstate_f: BlockState.Properties.north set value "true"
execute if block ~ ~ ~ #blockstate_f:all[south=false] run data modify storage blockstate_f: BlockState.Properties.south set value "false"
execute if block ~ ~ ~ #blockstate_f:all[south=true] run data modify storage blockstate_f: BlockState.Properties.south set value "true"
execute if block ~ ~ ~ #blockstate_f:all[up=false] run data modify storage blockstate_f: BlockState.Properties.up set value "false"
execute if block ~ ~ ~ #blockstate_f:all[up=true] run data modify storage blockstate_f: BlockState.Properties.up set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=false] run data modify storage blockstate_f: BlockState.Properties.west set value "false"
execute if block ~ ~ ~ #blockstate_f:all[west=true] run data modify storage blockstate_f: BlockState.Properties.west set value "true"