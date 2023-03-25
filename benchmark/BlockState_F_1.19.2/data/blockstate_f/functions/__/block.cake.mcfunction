data modify storage blockstate_f: BlockState set value {Name:"minecraft:cake",Properties:{bites:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[bites=1] run data modify storage blockstate_f: BlockState.Properties.bites set value "1"
execute if block ~ ~ ~ #blockstate_f:all[bites=2] run data modify storage blockstate_f: BlockState.Properties.bites set value "2"
execute if block ~ ~ ~ #blockstate_f:all[bites=3] run data modify storage blockstate_f: BlockState.Properties.bites set value "3"
execute if block ~ ~ ~ #blockstate_f:all[bites=4] run data modify storage blockstate_f: BlockState.Properties.bites set value "4"
execute if block ~ ~ ~ #blockstate_f:all[bites=5] run data modify storage blockstate_f: BlockState.Properties.bites set value "5"
execute if block ~ ~ ~ #blockstate_f:all[bites=6] run data modify storage blockstate_f: BlockState.Properties.bites set value "6"