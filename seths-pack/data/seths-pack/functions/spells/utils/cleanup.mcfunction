# Seths Datapack for Minecraft 1.15.2 Java Edition

# Post Spell Cleanup

# Send scroll to caster
tp @e[tag=scroll,tag=finished] @p[tag=caster]
# Kill wand
execute as @e[tag=wand] run kill @s
# Give back wand if the caster doesnt already have one
execute as @p[tag=caster,nbt=!{Inventory:[{tag:{display:{Name:'{"text":"Activator"}'}}}]}] run function seths-pack:spells/utils/activator
# Remove caster tag
execute as @e[tag=caster] run tag @s remove caster
