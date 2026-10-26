# Shared Lives - 제거 전 정리: 강제 관전자 복귀 후 스코어보드 목표 삭제
# 이 함수를 실행한 뒤 /datapack disable 또는 폴더 삭제로 데이터팩을 제거하세요.
execute as @a[scores={sl_forced=1}] run gamemode survival @s
scoreboard objectives remove sl_deaths
scoreboard objectives remove sl_leave
scoreboard objectives remove sl_join
scoreboard objectives remove sl_forced
scoreboard objectives remove sl_data
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"Shared Lives 데이터가 삭제되었습니다. 이제 데이터팩을 비활성화/삭제하세요. (삭제 전 /reload 하면 기본값으로 재설치됩니다)",color:"gray"}]
