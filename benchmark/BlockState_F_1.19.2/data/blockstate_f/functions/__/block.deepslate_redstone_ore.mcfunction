data modify storage blockstate_f: BlockState set value {Name:"minecraft:deepslate_redstone_ore",Properties:{lit:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"