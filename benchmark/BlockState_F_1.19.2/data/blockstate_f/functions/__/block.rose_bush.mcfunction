data modify storage blockstate_f: BlockState set value {Name:"minecraft:rose_bush"}
execute if block ~ ~ ~ #blockstate_f:all[half=lower] run data modify storage blockstate_f: BlockState.Properties.half set value "lower"
execute if block ~ ~ ~ #blockstate_f:all[half=upper] run data modify storage blockstate_f: BlockState.Properties.half set value "upper"