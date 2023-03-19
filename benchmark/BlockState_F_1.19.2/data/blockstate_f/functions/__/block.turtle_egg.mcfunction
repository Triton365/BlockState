data modify storage blockstate_f: BlockState set value {Name:"minecraft:turtle_egg"}
execute if block ~ ~ ~ #blockstate_f:all[eggs=1] run data modify storage blockstate_f: BlockState.Properties.eggs set value "1"
execute if block ~ ~ ~ #blockstate_f:all[eggs=2] run data modify storage blockstate_f: BlockState.Properties.eggs set value "2"
execute if block ~ ~ ~ #blockstate_f:all[eggs=3] run data modify storage blockstate_f: BlockState.Properties.eggs set value "3"
execute if block ~ ~ ~ #blockstate_f:all[eggs=4] run data modify storage blockstate_f: BlockState.Properties.eggs set value "4"
execute if block ~ ~ ~ #blockstate_f:all[hatch=0] run data modify storage blockstate_f: BlockState.Properties.hatch set value "0"
execute if block ~ ~ ~ #blockstate_f:all[hatch=1] run data modify storage blockstate_f: BlockState.Properties.hatch set value "1"
execute if block ~ ~ ~ #blockstate_f:all[hatch=2] run data modify storage blockstate_f: BlockState.Properties.hatch set value "2"