data modify storage blockstate_f: BlockState set value {Name:"minecraft:green_candle"}
execute if block ~ ~ ~ #blockstate_f:all[candles=1] run data modify storage blockstate_f: BlockState.Properties.candles set value "1"
execute if block ~ ~ ~ #blockstate_f:all[candles=2] run data modify storage blockstate_f: BlockState.Properties.candles set value "2"
execute if block ~ ~ ~ #blockstate_f:all[candles=3] run data modify storage blockstate_f: BlockState.Properties.candles set value "3"
execute if block ~ ~ ~ #blockstate_f:all[candles=4] run data modify storage blockstate_f: BlockState.Properties.candles set value "4"
execute if block ~ ~ ~ #blockstate_f:all[lit=false] run data modify storage blockstate_f: BlockState.Properties.lit set value "false"
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"