# Seths Datapack for Minecraft 1.14.2 Java Edition

# HOME Spell

#  Goes to
# /summon minecraft:armor_stand ~ ~1 ~ {NoGravity:1,Invisible:1,Tags:["home"]}

# Easy Scroll Reference unless already made
execute unless entity @e[tag=home_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"HOME\"}"}}}}] add home_scroll

# Particles & Sound for start
execute at @e[tag=home_scroll] run particle minecraft:poof ~ ~ ~ .5 .5 .5 .01 100 normal
execute at @e[tag=caster] run particle minecraft:poof ~ ~ ~ .5 .5 .5 .01 100 normal
execute at @e[tag=home_scroll] as @e[type=minecraft:player,distance=..15] run playsound minecraft:item.chorus_fruit.teleport record @s

# Actually Teleport To home (if you can)

execute unless entity @e[tag=home] run say We cannot find your home...
execute at @e[tag=scroll] as @p[tag=caster] run tp @s @e[limit=1,tag=home]

# # Particles & Sound for end
execute at @p[tag=caster] run particle minecraft:poof ~ ~ ~ .5 .5 .5 .01 100 normal
execute at @e[tag=home_scroll] as @e[type=minecraft:player,distance=..15] run playsound minecraft:item.chorus_fruit.teleport record @s

# Cleanup Trigger
tag @e[tag=home_scroll] add finished
