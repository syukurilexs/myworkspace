#!/bin/bash

# Author: Syukur bin Md Kassim
# Email: syukirah@gmail.com
#
# Syukur Workspace setup script
# 
# Color reference https://www.shellhacks.com/bash-colors/

# ##
# Variables

# Colors

# Foreground
fgBlack=30
fgRed=31
fgGreen=32
fgBrown=33
fgBlue=34
fgPurple=35
fgCyan=36
fgLightGray=37
fgWhite='1;37'

# Background
bgBlack=40	
bgRed=41	
bgGreen=42	
bgBrown=43	
bgBlue=44	
bgPurple=45	
bgCyan=46	
bgLightGray=47

# Triangle
# Note: In order to use this symbol, we need to istall powerline font
# In ubuntu
# sudo apt install powerline
# sudo apt install fonts-powerline
triangle=$'\uE0B0'

PS1="\e[${fgPurple}m"
PS1+='$(pwd)' 
PS1+="\e[0m"
PS1+="\n"
PS1+="\e[${bgRed};${fgWhite}m \T \e[0m"
PS1+="\e[${bgGreen};${fgRed}m${triangle}\e[0m"
PS1+="\e[${bgGreen};${fgWhite}m syukur \e[0m"
PS1+="\e[${bgBlue};${fgGreen}m${triangle}\e[0m"
PS1+="\e[${bgBlue};${fgWhite}m \h \e[0m"
PS1+="\e[${fgBlue}m${triangle}\e[0m\n~ "
export PS1
