# BlockState
호출된 곳에 위치한 블록의 `BlockState` 값을 추출하는 루트테이블과, 호출된 곳에 위치한 블록을 폴링블록(`falling_block`)으로 변환하는 함수를 제공합니다. 물론 바닐라 루트테이블을 변조하지 않으며, 대신 이진 탐색으로 올바른 블록을 얻어냅니다.
<br>

## 다운로드
v1.1.0: <https://github.com/Triton365/BlockState/releases/download/v1.1.0/BlockState_v1.1.0.zip>   
<br><br>

## 사용법: 함수
`function` 명령어로 `blockstate:summon_falling_block` 함수를 호출합니다.   
그러면 함수를 호출한 곳에 있던 블록이 폴링블록(`falling_block`)으로 변환됩니다.   
<br>
아래는 간단한 테스트용 예제입니다. 발 밑 블록을 폴링블록으로 변환합니다.   
```mcfunction
execute at @s positioned ~ ~-0.1 ~ align xyz positioned ~0.5 ~ ~0.5 run function blockstate:convert_to_falling_block
```

### 예외
단순히 폴링블록으로 변환한다는 기능에 비해 생각해봐야 할 예외가 상당히 많습니다.
아래는 몇가지 예외 규칙들을 적어봤습니다.
- 호출한 위치에 있던 블록은 그대로 유지됩니다. 따라서 소환된 폴링블록이 원래 블록에 막힐 수 있습니다.   
- 폴링블록의 소환 위치는 함수 호출 위치와 완전히 동일합니다. 함수 내부에서 자동으로 `align`되지 않는다는 의미입니다.   
- 공기(`air`) 블록을 폴링블록으로 변환할 경우 모래가 됩니다. 의도하진 않았습니다.   
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): 블록 모델 파일이 없는 블록은 시각적으로 보이지 않습니다.
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록의 경우 폴링블록은 소환되지 않습니다.   
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 그 `blockState` 태그를 가져와 변환합니다. `blockState` 태그가 없는 경우 그대로 무빙 피스톤으로 변환합니다.   

따라서 이 함수를 적극 이용하는 것 보다는   
아래 루트테이블 사용법의 참고 용도로 쓰는 게 좋습니다.   
<br><br>

## 사용법: 루트테이블
`loot` 명령어로 `blockstate:get` 루트테이블을 호출합니다.   
그러면 호출한 위치에 있던 블록이 `BlockState` 형태로 바뀌어,
루트테이블이 반환하는 아이템의 `tag` 내부로 들어갑니다.   
<br>
아래는 간단한 테스트용 예제입니다. 발 밑 블록의 `BlockState`를 추출합니다.   
```mcfunction
execute at @s positioned ~ ~-0.1 ~ run loot replace entity @s weapon loot blockstate:get
data get entity @s SelectedItem.tag
```

### 반환
반환하는 아이템의 `tag` 내부는 보통 다음 구조로 이루어져 있습니다.   
상태가 완전히 없는 블록의 경우 `Properties` 태그는 생략됩니다.   
```
{Name:"minecraft:...",Properties:{...}}
```
참고로 개별적인 상태 하나하나는 기본값을 가지더라도 생략되지 않습니다.   
예를 들어, `snowy` 상태가 `false`인 잔디블록은 `snowy` 상태를 생략할 수 있으나,   
반환되는 아이템은 반드시 `Properties`에 `snowy:"false"`를 포함합니다.   

### 예외
`tag`가 생략된 아이템을 반환하는 예외도 존재합니다.   
구체적으로는 아마 다음과 같은 경우일 것으로 추측됩니다.   
- 주어진 위치의 청크가 언로드되어 있는 경우   
- 최대 높이 초과 또는 최저 높이 미만 영역에 있는 경우   
- 다른 버전 혹은 다른 모드에서 등장하는 블록인 경우   
<br><br><br>

## blockstate_datapack_generator.py
`blockstate_datapack_generator.py` 파일은 버전을 주면 이 데이터팩을 자동으로 생성해주는 파이썬 스크립트입니다. 간단하게 해당 파일을 열어서 VERSION 변수의 값을 원하는 값으로 변경한 뒤 실행하면 됩니다. 그러면 이 스크립트는 그 버전에 해당하는 블록 리스트를 [Data Generator](https://minecraft.fandom.com/wiki/Tutorials/Running_the_data_generator)로 생성한 뒤, 그 리스트를 기반으로 이진 탐색 루트테이블을 자동 생성합니다.
<br>
유지보수가 최대한 필요없는 시스템을 고안한 것이지만, 그럼에도 버전 간 루트테이블 구조에 차이가 발생한다면 어쩔 수 없이 코드를 수정해야만 합니다.
