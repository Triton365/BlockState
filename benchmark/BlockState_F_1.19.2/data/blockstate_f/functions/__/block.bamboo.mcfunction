data modify storage blockstate_f: BlockState set value {Name:"minecraft:bamboo"}
execute if block ~ ~ ~ #blockstate_f:all[age=0] run data modify storage blockstate_f: BlockState.Properties.age set value "0"
execute if block ~ ~ ~ #blockstate_f:all[age=1] run data modify storage blockstate_f: BlockState.Properties.age set value "1"
execute if block ~ ~ ~ #blockstate_f:all[leaves=large] run data modify storage blockstate_f: BlockState.Properties.leaves set value "large"
execute if block ~ ~ ~ #blockstate_f:all[leaves=none] run data modify storage blockstate_f: BlockState.Properties.leaves set value "none"
execute if block ~ ~ ~ #blockstate_f:all[leaves=small] run data modify storage blockstate_f: BlockState.Properties.leaves set value "small"
execute if block ~ ~ ~ #blockstate_f:all[stage=0] run data modify storage blockstate_f: BlockState.Properties.stage set value "0"
execute if block ~ ~ ~ #blockstate_f:all[stage=1] run data modify storage blockstate_f: BlockState.Properties.stage set value "1"