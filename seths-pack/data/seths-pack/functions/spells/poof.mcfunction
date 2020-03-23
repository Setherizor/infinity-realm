# Seths Datapack for Minecraft 1.15.2 Java Edition

# POOF Spell

# Easy Scroll Reference unless already made
execute unless entity @e[tag=poof_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"POOF\"}"}}}}] add poof_scroll
# Particles for Smoke
execute at @e[tag=poof_scroll] run particle minecraft:campfire_cosy_smoke ~ ~ ~ .5 .5 .5 .01 100 normal
# Sound Effect
execute at @e[tag=poof_scroll] as @e[type=minecraft:player,distance=..15] run playsound minecraft:entity.evoker.prepare_wololo record @s

# Cleanup Trigger
tag @e[tag=poof_scroll] add finished
