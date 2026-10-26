# Shared Lives - 남은 공유 목숨 설정. 사용법: /function sharedlives:admin/set {lives:5}
$scoreboard players set #lives sl_data $(lives)
execute if score #lives sl_data matches ..0 run scoreboard players set #lives sl_data 0
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"관리자가 남은 공유 목숨을 ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true},{text:" 개로 설정했습니다.",color:"white"}]
scoreboard players set #timer sl_data 20
function sharedlives:game/check
