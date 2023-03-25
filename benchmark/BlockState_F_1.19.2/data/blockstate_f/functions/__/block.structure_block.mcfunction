data modify storage blockstate_f: BlockState set value {Name:"minecraft:structure_block",Properties:{mode:"corner"}}
execute if block ~ ~ ~ #blockstate_f:all[mode=data] run data modify storage blockstate_f: BlockState.Properties.mode set value "data"
execute if block ~ ~ ~ #blockstate_f:all[mode=load] run data modify storage blockstate_f: BlockState.Properties.mode set value "load"
execute if block ~ ~ ~ #blockstate_f:all[mode=save] run data modify storage blockstate_f: BlockState.Properties.mode set value "save"