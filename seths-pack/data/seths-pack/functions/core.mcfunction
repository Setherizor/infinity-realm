#Code Zealot's Datapack Template for Minecraft 1.13 Java Edition
#Created by Code_Zealot
#URL: www.youtube.com/c/CodeZealot

#This file loads all of the 'core' function files for your datapack!

function seths-pack:spells/utils/trigger
execute if entity @e[tag=runprotect] run function seths-pack:spells/utils/protect_logic
scoreboard players reset @a[scores={jump=1..}] jump
