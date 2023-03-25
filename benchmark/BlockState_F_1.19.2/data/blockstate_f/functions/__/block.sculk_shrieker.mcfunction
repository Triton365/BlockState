data modify storage blockstate_f: BlockState set value {Name:"minecraft:sculk_shrieker",Properties:{can_summon:"false",shrieking:"false",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[can_summon=true] run data modify storage blockstate_f: BlockState.Properties.can_summon set value "true"
execute if block ~ ~ ~ #blockstate_f:all[shrieking=true] run data modify storage blockstate_f: BlockState.Properties.shrieking set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"