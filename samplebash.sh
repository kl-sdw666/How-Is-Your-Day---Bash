#!/bin/bash
#Silly little bash conversation interface
#Declare ext variable and unknownPhrases associative array
declare -A unknownPhrases
declare -i ext
ext=0 
#while loop to run the program
while [ $ext -eq 0 ]; do
  echo what is your name?
  read User_name
  echo "Hello $User_name, how are you?"
  read Status_string
  #Try to understand the Status_string
  case "$Status_string" in
    #case 1 : good
    good*) echo "I recognize 'good' - this is satisfactory!";;
    #case 2 : bad
    bad*) echo "I recognize 'bad' - I am sorry to hear that.";;
	# omnicient case : anything else - add phrase into associative array
    *) echo "I don't recognize '$Status_string'"
    unknownPhrases[ $User_name ]=$Status_string;;
  esac
  #print associative array of unknownPhrases and their User_name
  for i in "${!unknownPhrases[@]}"
  do
    echo "User  : $i"
    echo "Unknown phrase: ${unknownPhrases[$i]}"
  done
  #Until loop for Continue (y/n condition)
  continue=""
  until [[ $continue = "y"  || $continue = "n" ]] ; do
    echo "would you like to continue? (y/n)"
    read continue
    if [ $continue = "n" ]
    then let ext=1
    elif [ $continue = "y" ]
    then let ext=0
    else echo "Input not recognized."
    fi
  done
done
