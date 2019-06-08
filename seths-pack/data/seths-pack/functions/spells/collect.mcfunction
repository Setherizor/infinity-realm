# Seths Datapack for Minecraft 1.14.2 Java Edition

# COLLECT Spell

# Easy Scroll Reference unless already made
execute unless entity @e[tag=collect_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"COLLECT\"}"}}}}] add collect_scroll

# Particles
execute at @e[tag=collect_scroll] run particle minecraft:dripping_lava ~ ~2 ~ .7 .7 .7 5 600 normal
# Kill wand so we dont activate collected spells
execute as @e[tag=wand] run kill @s
# Tp Items
execute at @e[tag=collect_scroll] as @e[type=minecraft:item,distance=..10] run tp ~ ~2 ~
# Sound Effect
execute at @e[tag=collect_scroll] as @e[type=minecraft:player,distance=..10] run playsound minecraft:item.trident.riptide_2 record @s

# Cleanup Trigger
tag @e[tag=collect_scroll] add finished
