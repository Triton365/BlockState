data modify storage blockstate_f: BlockState set value {Name:"minecraft:water_cauldron",Properties:{level:"1"}}
execute if block ~ ~ ~ #blockstate_f:all[level=2] run data modify storage blockstate_f: BlockState.Properties.level set value "2"
execute if block ~ ~ ~ #blockstate_f:all[level=3] run data modify storage blockstate_f: BlockState.Properties.level set value "3"