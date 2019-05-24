# Seths Datapack for Minecraft 1.14.1 Java Edition

# CURSE Spell Beacon Cleanup

execute at @e[tag=curse_anchor] run fill ~15 ~-2 ~15 ~-15 ~2 ~-15 minecraft:air replace minecraft:end_gateway

kill @e[tag=curse_anchor]
