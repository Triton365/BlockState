data modify storage blockstate_f: BlockState set value {Name:"minecraft:jungle_sapling"}
execute if block ~ ~ ~ #blockstate_f:all[stage=0] run data modify storage blockstate_f: BlockState.Properties.stage set value "0"
execute if block ~ ~ ~ #blockstate_f:all[stage=1] run data modify storage blockstate_f: BlockState.Properties.stage set value "1"