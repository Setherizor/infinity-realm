# Seths Datapack for Minecraft 1.15.2 Java Edition

# Protect Entity Logic

# Additions for circle maker
execute at @e[tag=circle] at @p anchored eyes run tp @e[tag=circle] ~ ~5 ~
execute as @e[tag=circle] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 run particle minecraft:totem_of_undying ~ ~ ~ .01 .01 .01 .05 2 force
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 run effect give @e[distance=..1.4] minecraft:glowing 1 1 true
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 run effect give @e[distance=..1.4] minecraft:levitation 2 5 true
execute as @e[tag=circle] at @s positioned ^ ^-4 ^2.5 if entity @e[distance=..1.4,type=!minecraft:item] run kill @s

# Trigger on jump, if holding wand
execute at @a[scores={jump=1..}, nbt={SelectedItem:{tag:{display:{Name:'{"text":"Activator"}'}}}}] as @e[tag=circle,distance=..6,limit=1] run tag @s add seeker
# Reset score in gameloop

# Vertical Particle
execute as @e[tag=circle,tag=seeker] at @s run tp ^ ^-2 ^2.5
execute at @e[tag=circle,tag=seeker] run particle minecraft:flame ~ ~-1 ~ 0 .7 0 .01 100 force
tag @e[tag=circle,tag=seeker] remove circle

# FLYING FOR THESE NEW PROJECTILES

# Move towards target (facing) distance and speed is key difference to sam's defense

# Protector logic for sam's defence
execute as @e[tag=seeker,tag=protector] at @s anchored feet facing entity @e[tag=smitehim,distance=..100,sort=furthest] eyes if entity @e[tag=smitehim,distance=..100] run tp ^ ^ ^1

execute as @e[tag=seeker,tag=!protector] at @s anchored feet facing entity @e[tag=smitehim,distance=..30,sort=furthest] eyes if entity @e[tag=smitehim,distance=..30] run tp ^ ^ ^.3
execute as @e[tag=seeker,tag=!protector] at @s anchored feet facing entity @p eyes unless entity @e[tag=smitehim,distance=..30] run tp ^ ^-.09 ^-.3

# Particles
execute at @e[tag=seeker] run particle minecraft:flame ^ ^ ^ .1 .1 .1 .1 6 force
execute at @e[tag=seeker] run particle minecraft:dripping_lava ^ ^ ^ .1 .1 .1 .2 6 force

# Smite!
execute as @e[tag=seeker] at @s if entity @e[distance=..1.7,type=!minecraft:end_crystal,type=!minecraft:armor_stand] run summon minecraft:lightning_bolt ^ ^ ^

# Ending States
execute as @e[tag=seeker] at @s if entity @e[distance=..1.7,type=!minecraft:armor_stand] run kill @s
execute as @e[tag=seeker] at @s unless block ~ ~ ~ minecraft:air run kill @s

# Protector specific version
execute as @e[tag=seeker,tag=!protector] at @s unless entity @p[distance=..30] run kill @s
execute as @e[tag=seeker,tag=protector] at @s unless entity @e[tag=smitehim,distance=..100] run kill @s

# DEPRECATED SUMMONDER
# execute at @e[tag=tower] as @e[type=minecraft:end_crystal,distance=..10] unless entity @e[distance=..30,tag=protector] at @s run summon minecraft:armor_stand ~ ~5 ~ {Tags:["protector"],NoGravity:1,Invisible:1}
# /summon minecraft:armor_stand ~ ~ ~ {Tags:["tower"],Invisible:1}
