data modify storage blockstate_f: BlockState set value {Name:"minecraft:stripped_warped_stem",Properties:{axis:"x"}}
execute if block ~ ~ ~ #blockstate_f:all[axis=y] run data modify storage blockstate_f: BlockState.Properties.axis set value "y"
execute if block ~ ~ ~ #blockstate_f:all[axis=z] run data modify storage blockstate_f: BlockState.Properties.axis set value "z"