# Seths Datapack for Minecraft 1.15.2 Java Edition

# Spell Detection

## Tag Wand at trigger location
execute as @e[nbt={Item:{id:"minecraft:blaze_rod",tag:{display:{Name:"{\"text\":\"Activator\"}"}}}}] at @s if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:paper"}}] run tag @s add wand

## Tag Scroll near wand and base rest of commands on it
execute at @e[tag=wand] as @e[distance=..1,nbt={Item:{id:"minecraft:paper"}}] run tag @s add scroll

## Particle Effects for the scroll
execute at @e[tag=scroll] run particle minecraft:enchant ~ ~1.5 ~ .001 .001 .001 1 2 normal
execute at @e[tag=scroll] run particle minecraft:enchanted_hit ~ ~.2 ~ .1 .1 .1 .2 1 normal

# Caster Tagging Logic (One Name for Each Spell) within 10 blocks
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"POOF\"}"}}}}] run tag @p[distance=..10] add caster
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"HOME\"}"}}}}] run tag @p[distance=..10] add caster
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"BOOM\"}"}}}}] run tag @p[distance=..10] add caster
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"CURSE\"}"}}}}] run tag @p[distance=..10] add caster
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"COLLECT\"}"}}}}] run tag @p[distance=..10] add caster
execute at @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"PROTECT\"}"}}}}] run tag @p[distance=..10] add caster

## Spell Conditionals TODO: home,arrows
execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"POOF\"}"}}}}] run schedule function seths-pack:spells/poof 2s

execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"HOME\"}"}}}}] run schedule function seths-pack:spells/home 2s

execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"BOOM\"}"}}}}] run schedule function seths-pack:spells/boom 2s

execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"CURSE\"}"}}}}] run schedule function seths-pack:spells/curse 3s

execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"COLLECT\"}"}}}}] run schedule function seths-pack:spells/collect 1s

execute if entity @e[tag=scroll,tag=!queued,nbt={Item:{tag:{display:{Name:"{\"text\":\"PROTECT\"}"}}}}] run schedule function seths-pack:spells/protect 1s

# Prevent Double Execution
execute as @e[tag=scroll] run tag @s add queued

# Cleanup
execute if entity @e[tag=scroll,tag=finished] run function seths-pack:spells/utils/cleanup
