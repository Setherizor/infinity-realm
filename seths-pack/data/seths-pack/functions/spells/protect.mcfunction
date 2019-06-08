# Seths Datapack for Minecraft 1.14.2 Java Edition

# Protect Spell

# Easy Scroll Reference unless already made
execute unless entity @e[tag=protect_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"PROTECT\"}"}}}}] add protect_scroll
# Particles
execute at @e[tag=protect_scroll] run particle minecraft:nautilus ~ ~ ~ .5 .5 .5 .1 20 normal
# Sound Effect
execute at @e[tag=protect_scroll] as @e[type=minecraft:player,distance=..15] run playsound minecraft:item.firecharge.use record @s

# Summon CircleMaker
execute at @p[tag=caster] run summon minecraft:armor_stand ~ ~10 ~ {Tags:["circle","runprotect"],Invisible:1b,NoGravity:1b}

# Cleanup Trigger
tag @e[tag=protect_scroll] add finished
