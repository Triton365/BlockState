data modify storage blockstate_f: BlockState set value {Name:"minecraft:soul_lantern"}
execute if block ~ ~ ~ #blockstate_f:all[hanging=false] run data modify storage blockstate_f: BlockState.Properties.hanging set value "false"
execute if block ~ ~ ~ #blockstate_f:all[hanging=true] run data modify storage blockstate_f: BlockState.Properties.hanging set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"