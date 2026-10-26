# Shared Lives - 남은 공유 목숨 감소. 사용법: /function sharedlives:admin/remove {amount:1}
$scoreboard players remove #lives sl_data $(amount)
execute if score #lives sl_data matches ..0 run scoreboard players set #lives sl_data 0
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"관리자가 공유 목숨을 감소시켰습니다. 남은 공유 목숨: ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"red",bold:true}]
scoreboard players set #timer sl_data 20
function sharedlives:game/check
