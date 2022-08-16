execute unless entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f run tellraw @s "Loading chunk... (29999999, 0)"

# https://bugs.mojang.com/browse/MC-72849
# MC-72849: /data 명령어로 폴링블록의 BlockState를 변경해도 제대로 반영되지 않는 버그
# 폴링블록을 먼 곳(29999999, 0, 0)에 소환한 뒤 그곳에서 BlockState를 변경,
# 그 다음에 폴링블록을 원하는 위치로 tp하는 식으로 우회할 수 있습니다.


# 데이터를 한꺼번에 적용하기 위한 임시 저장소
data modify storage blockstate: temp set value {Tags:[]}

# blockstate:get 루트테이블 호출, 결과를 임시 저장소로 복사 ··· (1)
loot replace entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f weapon loot blockstate:get
execute store result storage blockstate: success byte 1 run data modify storage blockstate: temp.BlockState set from entity 98d008a9-d6de-4068-b9a4-e4eebbe5bc4f HandItems[0].tag

# 무빙 피스톤일 경우 이 블록의 blockState 값을 가져와 임시 저장소로 복사
execute if block ~ ~ ~ moving_piston run data modify storage blockstate: temp.BlockState set from block ~ ~ ~ blockState

# 블록의 모든 NBT를 가져와 임시 저장소로 복사
execute unless block ~ ~ ~ moving_piston run data modify storage blockstate: temp.TileEntityData set from block ~ ~ ~

# (1)이 성공한 경우 폴링블록 소환
execute if data storage blockstate: {success:1b} in overworld run summon falling_block 29999999 19999999 0 {Time:1,DropItem:0b,Tags:[blockstate.init]}

# 임시 저장소에 있던 모든 데이터를 폴링블록에 적용, 그리고 함수 호출 위치로 tp
execute as @e[type=falling_block,tag=blockstate.init] run function blockstate:private/as_falling_block
#│  data modify entity @s {} merge from storage blockstate: temp
#└─ tp @s ~ ~ ~