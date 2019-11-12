#!/bin/bash
# This is a comment!
#echo "Hello      World"       # This is a comment, too!
#echo "Hello World"
#echo "Hello * World"
#echo Hello * World
#echo Hello      World
#echo "Hello" World
#echo Hello "     " World
#echo "Hello "*" World"
#echo `hello` world
#echo 'hello' world
declare -A unknownPhrases
exitCommand = "0"
while [$exitCommand = "0"]
do
echo what is your name?
read User_name
echo "Hello $User_name, how are you?"
read Status_string
#Try to understand the Status_string
case "$Status_string" in
  #case 1
  good*) echo "I recognize 'good' - this is satisfactory!";;
  #case 2
  bad*) echo "I recognize 'bad' - I am sorry to hear that.";;
  *) echo "I don't recognize '$Status_string'"
  unknownPhrases[$User_name]=$Status_string
  esac
for i in "${!unknownPhrases[@]}"
do
  echo "key  : $i"
  echo "value: ${unknownPhrases[$i]}"
done
echo would you like to continue? (y/n)
read continue
if [continue = n]
then exitCommand = "1"
done
 