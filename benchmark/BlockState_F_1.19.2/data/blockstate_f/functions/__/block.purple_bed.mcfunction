data modify storage blockstate_f: BlockState set value {Name:"minecraft:purple_bed"}
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[occupied=false] run data modify storage blockstate_f: BlockState.Properties.occupied set value "false"
execute if block ~ ~ ~ #blockstate_f:all[occupied=true] run data modify storage blockstate_f: BlockState.Properties.occupied set value "true"
execute if block ~ ~ ~ #blockstate_f:all[part=foot] run data modify storage blockstate_f: BlockState.Properties.part set value "foot"
execute if block ~ ~ ~ #blockstate_f:all[part=head] run data modify storage blockstate_f: BlockState.Properties.part set value "head"