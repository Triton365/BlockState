data modify storage blockstate_f: BlockState set value {Name:"minecraft:deepslate_redstone_ore"}
execute if block ~ ~ ~ #blockstate_f:all[lit=false] run data modify storage blockstate_f: BlockState.Properties.lit set value "false"
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"