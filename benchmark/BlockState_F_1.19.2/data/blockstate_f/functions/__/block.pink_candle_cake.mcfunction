data modify storage blockstate_f: BlockState set value {Name:"minecraft:pink_candle_cake"}
execute if block ~ ~ ~ #blockstate_f:all[lit=false] run data modify storage blockstate_f: BlockState.Properties.lit set value "false"
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"