data modify storage blockstate_f: BlockState set value {Name:"minecraft:tnt"}
execute if block ~ ~ ~ #blockstate_f:all[unstable=false] run data modify storage blockstate_f: BlockState.Properties.unstable set value "false"
execute if block ~ ~ ~ #blockstate_f:all[unstable=true] run data modify storage blockstate_f: BlockState.Properties.unstable set value "true"