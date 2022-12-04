# BlockState
호출된 곳에 위치한 블록의 `BlockState` 값을 추출하는 루트테이블과, 호출된 곳에 위치한 블록을 폴링블록(`falling_block`)으로 변환하는 함수를 제공합니다. 물론 바닐라 루트테이블을 변조하지 않으며, 대신 이진 탐색으로 올바른 블록을 얻어냅니다.   

## 다운로드
- JE 1.19.2: <https://github.com/Triton365/BlockState/releases/download/v1.3.0/BlockState_1.19.2.zip>   
<br><br>

## 사용법: 함수
`blockstate:summon_falling_block` 함수를 호출하여 해당 위치의 블록을 폴링블록(`falling_block`)으로 변환할 수 있습니다.   
아래는 간단한 테스트용 예제입니다. 발 밑 블록을 폴링블록으로 변환합니다.   
```mcfunction
execute at @s positioned ~ ~-0.1 ~ align xyz positioned ~0.5 ~ ~0.5 run function blockstate:convert_to_falling_block
```
이 함수를 적극 활용하고자 한다면 주의해야할 점이 몇가지 있습니다.   
- 호출한 위치에 있던 블록은 그대로 유지됩니다. 따라서 소환된 폴링블록이 원래 블록에 막힐 수 있습니다.   
- 폴링블록의 소환 위치는 함수 호출 위치와 완전히 동일합니다. 함수 내부에서 자동으로 `align`되지 않는다는 의미입니다.   
- 공기(`air`) 블록을 폴링블록으로 변환할 경우 모래가 됩니다. 의도한 건 아닙니다.   
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): 블록 모델 파일이 없는 블록은 시각적으로 보이지 않습니다.
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록의 경우 폴링블록은 소환되지 않습니다.   
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 그 `blockState` 태그를 가져와 변환합니다. `blockState` 태그가 없는 경우 그대로 무빙 피스톤으로 변환합니다.    
<br><br>

## 사용법: 루트테이블
`blockstate:get` 루트테이블을 호출하여 해당 위치에 있는 블록의 `BlockState` 데이터를 얻을 수 있습니다.   
아래는 간단한 테스트용 예제입니다. 발 밑 블록의 `BlockState`를 추출합니다.   
```mcfunction
execute at @s positioned ~ ~-0.1 ~ run loot replace entity @s weapon loot blockstate:get
data get entity @s SelectedItem.tag
```
루트테이블이 반환하는 아이템의 `tag`에서 `BlockState` 데이터를 찾을 수 있습니다.
```
{Name:"minecraft:...",Properties:{...}}
```
추가로, 개별적인 상태 하나하나는 기본값을 가지더라도 생략되지 않습니다. 예를 들어 `snowy` 상태가 `false`인 잔디블록은 `snowy` 상태를 생략할 수 있으나, 반환되는 아이템은 반드시 `Properties`에 `snowy:"false"`를 포함합니다.   
상태가 완전히 없는 블록의 경우 `Properties` 태그가 생략되기도 하며, 아래와 같은 상황에서는 `tag`가 존재하지 않는 아이템이 나오기도 합니다.   
- 주어진 위치의 청크가 언로드되어 있는 경우   
- 최대 높이 초과 또는 최저 높이 미만 영역에 있는 경우   
- 다른 버전 혹은 다른 모드에서 등장하는 블록인 경우   
<br><br><br>

## blockstate_datapack_generator.py
`blockstate_datapack_generator.py` 파일은 버전을 주면 이 데이터팩을 자동으로 생성해주는 파이썬 스크립트입니다. 간단하게 해당 파일을 열어서 VERSION 변수의 값을 원하는 값으로 변경한 뒤 실행하면 됩니다. 그러면 이 스크립트는 그 버전에 해당하는 블록 리스트를 [Data Generator](https://minecraft.fandom.com/wiki/Tutorials/Running_the_data_generator)로 생성한 뒤, 그 리스트를 기반으로 이진 탐색 루트테이블을 자동 생성합니다.
<br>
유지보수가 최대한 필요없는 시스템을 고안한 것이지만, 그럼에도 버전 간 루트테이블 구조에 차이가 발생한다면 그때는 어쩔 수 없이 누군가가 직접 코드를 수정해야만 합니다.
