# Shared Lives - 상태 점검 (틱마다 + 관리자 명령 직후)
execute if score #lives sl_data matches ..0 run scoreboard players set #lives sl_data 0
execute if score #gameover sl_data matches 0 if score #lives sl_data matches 0 run function sharedlives:game/over
execute if score #gameover sl_data matches 1 if score #lives sl_data matches 1.. run function sharedlives:game/resume
