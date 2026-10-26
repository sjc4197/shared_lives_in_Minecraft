# Shared Lives - 게임오버 진입
scoreboard players set #gameover sl_data 1
scoreboard players set #lives sl_data 0
scoreboard players set #timer sl_data 20
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"공유 목숨이 모두 소진되었습니다. 게임 오버! 모든 플레이어가 관전자 모드로 전환됩니다.",color:"red",bold:true}]
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"관리자는 ",color:"gray"},{text:"/function sharedlives:admin/reset",color:"yellow",click_event:{action:"suggest_command",command:"/function sharedlives:admin/reset"}},{text:" 으로 새 게임을 시작할 수 있습니다.",color:"gray"}]
execute as @a run function sharedlives:game/enforce_player
