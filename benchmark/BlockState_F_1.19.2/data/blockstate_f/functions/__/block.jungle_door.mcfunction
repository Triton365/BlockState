data modify storage blockstate_f: BlockState set value {Name:"minecraft:jungle_door",Properties:{facing:"east",half:"lower",hinge:"left",open:"false",powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[half=upper] run data modify storage blockstate_f: BlockState.Properties.half set value "upper"
execute if block ~ ~ ~ #blockstate_f:all[hinge=right] run data modify storage blockstate_f: BlockState.Properties.hinge set value "right"
execute if block ~ ~ ~ #blockstate_f:all[open=true] run data modify storage blockstate_f: BlockState.Properties.open set value "true"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"