# Seths Datapack for Minecraft 1.14.1 Java Edition

# Post Spell Cleanup

# Send scroll to caster
tp @e[tag=scroll,tag=finished] @p[tag=caster]
# Kill wand
execute as @e[tag=wand] run kill @s
# Give back wand unless caster already has one
give @p[tag=caster,nbt=!{Inventory:[{tag:{display:{Name:'{"text":"Activator"}'}}}]}] stick{display:{Name:"{\"text\":\"Activator\"}"},Enchantments:[{id:sharpness,lvl:3},{id:unbreaking,lvl:3},{id:fortune,lvl:3}]} 1
# Remove caster tag
execute as @e[tag=caster] run tag @s remove caster
