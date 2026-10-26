# Shared Lives - 게임오버 유지 (매 틱)
execute as @a[gamemode=!spectator] run function sharedlives:game/enforce_player
scoreboard players reset @a[scores={sl_deaths=1..}] sl_deaths
