data modify storage blockstate_f: BlockState set value {Name:"minecraft:repeating_command_block",Properties:{conditional:"false",facing:"down"}}
execute if block ~ ~ ~ #blockstate_f:all[conditional=true] run data modify storage blockstate_f: BlockState.Properties.conditional set value "true"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=up] run data modify storage blockstate_f: BlockState.Properties.facing set value "up"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"