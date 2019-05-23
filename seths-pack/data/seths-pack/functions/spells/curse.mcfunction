# Seths Datapack for Minecraft 1.14.1 Java Edition

# CURSE Spell

# Easy Scroll Reference unless already made
execute unless entity @e[tag=curse_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"CURSE\"}"}}}}] add curse_scroll

# Beacon things setup
execute at @e[tag=curse_scroll] run summon minecraft:armor_stand ~ ~25 ~ {NoGravity:1,Invisible:0,Tags:["curse_anchor"]}

execute at @e[tag=curse_anchor] run setblock ~7 ~ ~7 minecraft:end_gateway{Age:60l}
execute at @e[tag=curse_anchor] run setblock ~7 ~ ~-7 minecraft:end_gateway{Age:50l}
execute at @e[tag=curse_anchor] run setblock ~-7 ~ ~7 minecraft:end_gateway{Age:40l}
execute at @e[tag=curse_anchor] run setblock ~-7 ~ ~-7 minecraft:end_gateway{Age:30l}

# Beacon Things Takedown
schedule function seths-pack:spells/utils/curse_cleanup 10s

# Particles
execute at @e[tag=curse_scroll] run particle minecraft:dragon_breath ~ ~ ~ .4 1 .4 .02 400 normal

# Sound Effect Curse
execute at @e[tag=curse_scroll] as @e[type=minecraft:player,distance=..50] run playsound minecraft:entity.elder_guardian.curse record @s

# Actual Lightning Curse
execute as @e[type=!minecraft:player,type=!minecraft:horse,type=!minecraft:cat,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:item_frame,type=!minecraft:tnt,type=!minecraft:villager,type=!minecraft:firework_rocket,type=!minecraft:armor_stand,type=!minecraft:potion,type=!minecraft:leash_knot,distance=..30] at @s run summon minecraft:lightning_bolt ~ ~ ~

# Cleanup Trigger
tag @e[tag=curse_scroll] add finished
