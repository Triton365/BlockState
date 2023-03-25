data remove storage blockstate_benchmark: BlockState
execute positioned ~ ~-.5 ~ run function blockstate_f:get
data modify storage blockstate_benchmark: BlockState set from storage blockstate_f: BlockState