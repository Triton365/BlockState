# BlockState
 호출된 곳에 위치한 블록의 BlockState 데이터를 추출하는 루트테이블을 제공합니다. 바닐라 루트테이블을 변조하지 않으며, 오직 이진 탐색으로만 올바른 블록을 얻어냅니다.<br>
 이진 탐색은 루트테이블의 `type:alternatives`를 이용하였습니다. `children`에 엔트리 두개를 넣고 그중 한쪽에만 조건문을 달아줌으로써 if&else문을 재현할 수 있으며, 이 방식을 사용할 경우 if만으로 모든것을 처리해야 하는 기존 함수트리보다 2배이상 빠르다는 장점이 있습니다.<br>
<br><br>

## 다운로드
- JE 1.19.2: 
- JE 1.19.3: 
- JE 1.19.4: 
<br><br>

## 루트테이블 사용법
`blockstate:get` 루트테이블을 호출하여 해당 위치에 있는 블록의 BlockState 데이터를 얻을 수 있습니다.<br>
아래는 간단한 테스트용 예제입니다. 발 밑 블록의 BlockState를 추출합니다.<br>
```mcfunction
execute at @s positioned ~ ~-0.1 ~ run loot replace entity @s weapon loot blockstate:get
data get entity @s SelectedItem.tag
```
루트테이블이 반환하는 아이템의 `tag` 내부에서 BlockState 데이터를 찾을 수 있으며 다음과 같은 구조로 되어있습니다.
```
{Name:"minecraft:...",Properties:{...}}
```
추가로, 개별적인 상태 하나하나는 기본값을 가지더라도 생략되지 않습니다. 예를 들어 `snowy` 상태가 `false`인 잔디블록은 `snowy` 상태를 생략할 수 있으나, 반환되는 아이템은 반드시 `Properties`에 `snowy:"false"`를 포함합니다.<br>
상태가 완전히 없는 블록의 경우 `Properties` 태그가 생략되기도 하며, 아래와 같은 상황에서는 `tag`가 존재하지 않는 아이템이 나오기도 합니다.
- 주어진 위치의 청크가 언로드되어 있는 경우
- 최대 높이 초과 또는 최저 높이 미만 영역에 있는 경우
- 다른 버전 혹은 다른 모드에서 등장하는 블록인 경우
<br><br>

## 폴링 블록(falling_block)에 적용시 주의사항
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록이 감지될 경우 루트테이블은 태그가 존재하지 않는 아이템을 반환합니다.
- 폴링블록에 공기(`air`)를 넣으면 기본값인 모래(`sand`)로 강제 변경됩니다.
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): 블록 모델 파일이 없는 블록은 시각적으로 보이지 않습니다.
- [MC-72849](https://bugs.mojang.com/browse/MC-72849): /data 명령어로 폴링블록의 BlockState를 변경해도 시각적으로 반영되지 않습니다. 폴링블록을 먼 곳(29999999, 0, 0)에 소환한 뒤 그곳에서 BlockState를 변경, 그 다음에 폴링블록을 원하는 위치로 tp하는 식으로 우회할 수 있습니다.
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 해당 무빙 피스톤의 `blockState` 태그를 가져와서 변환해야 합니다.
<br><br>

## 블록 디스플레이(block_display)에 적용시 주의사항
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록이 감지될 경우 루트테이블은 태그가 존재하지 않는 아이템을 반환합니다.
- [MC-259990](https://bugs.mojang.com/browse/MC-259990): 블록 디스플레이에 머리, 현수막, 표지판, 종을 적용할 경우 시각적으로 보이지 않습니다.
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 해당 무빙 피스톤의 `blockState` 태그를 가져와서 변환해야 합니다.
<br><br>

## blockstate_datapack_generator.py
`blockstate_datapack_generator.py` 파일은 버전을 주면 이 데이터팩을 자동으로 생성해주는 파이썬 스크립트입니다. 간단하게 해당 파일을 열어서 VERSION 변수의 값을 원하는 값으로 변경한 뒤 실행하면 됩니다. 그러면 이 스크립트는 그 버전에 해당하는 블록 리스트를 [Data Generator](https://minecraft.fandom.com/wiki/Tutorials/Running_the_data_generator)로 생성한 뒤, 그 리스트를 기반으로 이진 탐색 루트테이블을 자동 생성합니다.<br>
유지보수가 최대한 필요없는 시스템을 고안한 것이지만, 그럼에도 버전 간 루트테이블 구조에 차이가 발생한다면 그때는 어쩔 수 없이 직접 코드를 수정해야 한다는 단점이 존재합니다.<br>
<br><br>
