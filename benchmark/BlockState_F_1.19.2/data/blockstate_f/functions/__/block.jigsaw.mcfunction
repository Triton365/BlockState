data modify storage blockstate_f: BlockState set value {Name:"minecraft:jigsaw",Properties:{orientation:"down_east"}}
execute if block ~ ~ ~ #blockstate_f:all[orientation=down_north] run data modify storage blockstate_f: BlockState.Properties.orientation set value "down_north"
execute if block ~ ~ ~ #blockstate_f:all[orientation=down_south] run data modify storage blockstate_f: BlockState.Properties.orientation set value "down_south"
execute if block ~ ~ ~ #blockstate_f:all[orientation=down_west] run data modify storage blockstate_f: BlockState.Properties.orientation set value "down_west"
execute if block ~ ~ ~ #blockstate_f:all[orientation=east_up] run data modify storage blockstate_f: BlockState.Properties.orientation set value "east_up"
execute if block ~ ~ ~ #blockstate_f:all[orientation=north_up] run data modify storage blockstate_f: BlockState.Properties.orientation set value "north_up"
execute if block ~ ~ ~ #blockstate_f:all[orientation=south_up] run data modify storage blockstate_f: BlockState.Properties.orientation set value "south_up"
execute if block ~ ~ ~ #blockstate_f:all[orientation=up_east] run data modify storage blockstate_f: BlockState.Properties.orientation set value "up_east"
execute if block ~ ~ ~ #blockstate_f:all[orientation=up_north] run data modify storage blockstate_f: BlockState.Properties.orientation set value "up_north"
execute if block ~ ~ ~ #blockstate_f:all[orientation=up_south] run data modify storage blockstate_f: BlockState.Properties.orientation set value "up_south"
execute if block ~ ~ ~ #blockstate_f:all[orientation=up_west] run data modify storage blockstate_f: BlockState.Properties.orientation set value "up_west"
execute if block ~ ~ ~ #blockstate_f:all[orientation=west_up] run data modify storage blockstate_f: BlockState.Properties.orientation set value "west_up"