# Seths Datapack for Minecraft 1.14.2 Java Edition

# Research into fireballs
execute at @a[scores={shoot=1}] run summon minecraft:armor_stand ~ ~-5 ~ {Small:1,Tags:["init","go"],CustomName:'{"text":"fireball"}',CustomNameVisible:0,Invisible:1,NoGravity:1b}

execute as @a[scores={shoot=1}] at @s run tp @e[tag=init] ^ ^ ^1.6

execute as @e[tag=init] at @s facing entity @p feet run tp ~ ~ ~

tag @e[tag=init] add stand
tag @e[tag=init] remove init
