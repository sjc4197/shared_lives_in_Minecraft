# Shared Lives - 최초 설치 시 기본값 (수동 재초기화: /function sharedlives:admin/reset)
scoreboard players set #max_lives sl_data 5
scoreboard players operation #lives sl_data = #max_lives sl_data
scoreboard players set #gameover sl_data 0
scoreboard players set #actionbar sl_data 1
scoreboard players set #timer sl_data 0
scoreboard players set #installed sl_data 1
