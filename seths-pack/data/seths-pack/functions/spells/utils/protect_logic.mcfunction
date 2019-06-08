# Seths Datapack for Minecraft 1.14.2 Java Edition

# Protect Entity Logic

# Additions for circle maker
execute at @e[tag=circle] at @p anchored eyes run tp @e[tag=circle] ~ ~5 ~
execute as @e[tag=circle] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 run particle minecraft:totem_of_undying ~ ~ ~ .01 .01 .01 .05 2 force
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 run effect give @e[distance=...5] minecraft:glowing 1 1 true
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 if entity @e[distance=..1.5,type=!minecraft:item] run kill @e[distance=..1.5,type=!minecraft:item]
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 if entity @e[distance=..1.5,type=!minecraft:item] run kill @s

# Trigger on jump, if holding wand
execute at @a[scores={jump=1..}, nbt={SelectedItem:{tag:{display:{Name:'{"text":"Activator"}'}}}}] as @e[tag=circle,distance=..6,limit=1] run tag @s add seeker
scoreboard players reset @a[scores={jump=1..}] jump

# Vertical Particle
execute as @e[tag=circle,tag=seeker] at @s run tp ^ ^-2 ^2.5
execute at @e[tag=circle,tag=seeker] run particle minecraft:flame ~ ~-1 ~ 0 1 0 .01 100 force
tag @e[tag=circle,tag=seeker] remove circle

# FLYING FOR THESE NEW PROJECTILES

# Move towards target (facing)
execute as @e[tag=seeker] at @s anchored feet facing entity @e[tag=smitehim,distance=..30,sort=furthest] eyes if entity @e[tag=smitehim,distance=..30] run tp ^ ^ ^.3
execute as @e[tag=seeker] at @s anchored feet facing entity @p eyes unless entity @e[tag=smitehim,distance=..30] run tp ^ ^-.2 ^-.3

# Particles
execute at @e[tag=seeker] run particle minecraft:flame ^ ^ ^ .1 .1 .1 .1 6 force
execute at @e[tag=seeker] run particle minecraft:dripping_lava ^ ^ ^ .1 .1 .1 .2 6 force

# Smite!
execute as @e[tag=seeker] at @s if entity @e[distance=..1.7,type=!minecraft:end_crystal,type=!minecraft:armor_stand] run summon minecraft:lightning_bolt ^ ^ ^

# Ending States
execute as @e[tag=seeker] at @s if entity @e[distance=..1.7,type=!minecraft:armor_stand] run kill @s
execute as @e[tag=seeker] at @s unless block ~ ~ ~ minecraft:air run kill @s
execute as @e[tag=seeker] at @s unless entity @p[distance=..30] run kill @s

# DEPRECATED SUMMONDER
# execute at @e[type=minecraft:end_crystal,distance=..20] unless entity @e[distance=..30,tag=seeker] run summon minecraft:armor_stand ~ ~6 ~ {Tags:["seeker"],NoGravity:1,Invisible:0}
