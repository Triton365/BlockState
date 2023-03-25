data modify storage blockstate_f: BlockState set value {Name:"minecraft:note_block",Properties:{instrument:"banjo",note:"0",powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[instrument=basedrum] run data modify storage blockstate_f: BlockState.Properties.instrument set value "basedrum"
execute if block ~ ~ ~ #blockstate_f:all[instrument=bass] run data modify storage blockstate_f: BlockState.Properties.instrument set value "bass"
execute if block ~ ~ ~ #blockstate_f:all[instrument=bell] run data modify storage blockstate_f: BlockState.Properties.instrument set value "bell"
execute if block ~ ~ ~ #blockstate_f:all[instrument=bit] run data modify storage blockstate_f: BlockState.Properties.instrument set value "bit"
execute if block ~ ~ ~ #blockstate_f:all[instrument=chime] run data modify storage blockstate_f: BlockState.Properties.instrument set value "chime"
execute if block ~ ~ ~ #blockstate_f:all[instrument=cow_bell] run data modify storage blockstate_f: BlockState.Properties.instrument set value "cow_bell"
execute if block ~ ~ ~ #blockstate_f:all[instrument=didgeridoo] run data modify storage blockstate_f: BlockState.Properties.instrument set value "didgeridoo"
execute if block ~ ~ ~ #blockstate_f:all[instrument=flute] run data modify storage blockstate_f: BlockState.Properties.instrument set value "flute"
execute if block ~ ~ ~ #blockstate_f:all[instrument=guitar] run data modify storage blockstate_f: BlockState.Properties.instrument set value "guitar"
execute if block ~ ~ ~ #blockstate_f:all[instrument=harp] run data modify storage blockstate_f: BlockState.Properties.instrument set value "harp"
execute if block ~ ~ ~ #blockstate_f:all[instrument=hat] run data modify storage blockstate_f: BlockState.Properties.instrument set value "hat"
execute if block ~ ~ ~ #blockstate_f:all[instrument=iron_xylophone] run data modify storage blockstate_f: BlockState.Properties.instrument set value "iron_xylophone"
execute if block ~ ~ ~ #blockstate_f:all[instrument=pling] run data modify storage blockstate_f: BlockState.Properties.instrument set value "pling"
execute if block ~ ~ ~ #blockstate_f:all[instrument=snare] run data modify storage blockstate_f: BlockState.Properties.instrument set value "snare"
execute if block ~ ~ ~ #blockstate_f:all[instrument=xylophone] run data modify storage blockstate_f: BlockState.Properties.instrument set value "xylophone"
execute if predicate blockstate_f:state.note.1..4 run function blockstate_f:__/state.note.1.2.3.4
execute if predicate blockstate_f:state.note.5..9 run function blockstate_f:__/state.note.5.6.7.8.9
execute if predicate blockstate_f:state.note.10..14 run function blockstate_f:__/state.note.10.11.12.13.14
execute if predicate blockstate_f:state.note.15..19 run function blockstate_f:__/state.note.15.16.17.18.19
execute if predicate blockstate_f:state.note.20..24 run function blockstate_f:__/state.note.20.21.22.23.24
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"