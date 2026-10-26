# Shared Lives - 남은 공유 목숨 증가. 사용법: /function sharedlives:admin/add {amount:1}
$scoreboard players add #lives sl_data $(amount)
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"관리자가 공유 목숨을 추가했습니다. 남은 공유 목숨: ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true}]
scoreboard players set #timer sl_data 20
function sharedlives:game/check
