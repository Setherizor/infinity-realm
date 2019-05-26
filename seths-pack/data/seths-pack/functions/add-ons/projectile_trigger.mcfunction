# Seths Datapack for Minecraft 1.14.1 Java Edition

# Projectile Trigger

# Shoot when right click
execute as @a[scores={shoot=1}] run function seths-pack:add-ons/projectile

# SEEKING BATS
execute as @e[tag=go,tag=!init] at @s facing entity @e[limit=1,sort=nearest,type=minecraft:bat,distance=..25] feet run tp ~ ~ ~

# Movement while in air, or till hit thing or block
execute as @e[tag=stand,tag=go,tag=!init] at @s unless entity @e[type=minecraft:bat,distance=..25] run tp ^ ^ ^-.4

execute as @e[tag=stand,tag=go,tag=!init] at @s if entity @e[type=minecraft:bat,distance=..25] run tp ^ ^ ^.4

# Stop moving if hit block
execute as @e[tag=stand,tag=!init] at @s unless block ~ ~1.6 ~ minecraft:air run tag @s remove go

# Stop moving if hit entity
execute as @e[tag=stand,tag=!init] at @s positioned ~ ~.5 ~ if entity @e[tag=!stand,distance=.02..1] run tag @s remove go

# Stop moving if far from player
execute as @e[tag=stand,tag=!init] at @s unless entity @p[distance=..50] run tag @s remove go

# Particles
execute at @e[tag=stand] run particle minecraft:flame ~ ~1.6 ~ .1 .1 .1 .01 22 normal

# Explode/Kill when done moving
execute as @e[tag=stand,tag=!go] at @s run summon minecraft:lightning_bolt ~ ~1.7 ~

# Explode/Kill when done moving
execute as @e[tag=stand,tag=!go] run kill @s
