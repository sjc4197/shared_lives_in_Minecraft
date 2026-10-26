# Shared Lives - 기본(최대) 목숨 설정 (초기화 시 적용). 사용법: /function sharedlives:admin/set_max {lives:5}
$scoreboard players set #max_lives sl_data $(lives)
execute if score #max_lives sl_data matches ..0 run scoreboard players set #max_lives sl_data 1
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"기본 공유 목숨이 ",color:"white"},{score:{name:"#max_lives",objective:"sl_data"},color:"aqua",bold:true},{text:" 개로 설정되었습니다. (다음 초기화부터 적용, 현재 남은 목숨은 유지)",color:"white"}]
scoreboard players set #timer sl_data 20
