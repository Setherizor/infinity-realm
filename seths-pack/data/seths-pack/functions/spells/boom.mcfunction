# Seths Datapack for Minecraft 1.14.2 Java Edition

# BOOM Spell

# Easy Scroll Reference unless already made
execute unless entity @e[tag=boom_scroll] run tag @e[tag=scroll,nbt={Item:{tag:{display:{Name:"{\"text\":\"BOOM\"}"}}}}] add boom_scroll

# Summon TNT
execute at @e[tag=boom_scroll] run summon minecraft:tnt ~ ~ ~ {lit:1,Fuse:40}

# Cleanup Trigger
tag @e[tag=boom_scroll] add finished
