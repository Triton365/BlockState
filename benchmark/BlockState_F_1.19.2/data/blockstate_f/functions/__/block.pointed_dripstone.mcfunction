data modify storage blockstate_f: BlockState set value {Name:"minecraft:pointed_dripstone",Properties:{thickness:"base",vertical_direction:"down",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[thickness=frustum] run data modify storage blockstate_f: BlockState.Properties.thickness set value "frustum"
execute if block ~ ~ ~ #blockstate_f:all[thickness=middle] run data modify storage blockstate_f: BlockState.Properties.thickness set value "middle"
execute if block ~ ~ ~ #blockstate_f:all[thickness=tip] run data modify storage blockstate_f: BlockState.Properties.thickness set value "tip"
execute if block ~ ~ ~ #blockstate_f:all[thickness=tip_merge] run data modify storage blockstate_f: BlockState.Properties.thickness set value "tip_merge"
execute if block ~ ~ ~ #blockstate_f:all[vertical_direction=up] run data modify storage blockstate_f: BlockState.Properties.vertical_direction set value "up"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"