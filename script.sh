#!/bin/bash
while true; do
    read -p "This script uses the very powerful command 'git commit -f'. It can mess your GitHub repositories. Do you understand the consequences and want to continue? (yes\no): " yn
    case $yn in
        [Yy]* )break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "STARING";
mkdir -p tempRepos;
cp 'repos.txt' 'tempRepos'
cd tempRepos;
mkdir -p backups;
input="repos.txt";
while IFS= read -r line
do
  printf "\n-----------\nFor repo : '%s':\n" : $line
  if [[$line]]
  then
    printf "Repository already exist in tempRepos\n"
  fi
  git clone git@github.com:$line
  if ! test -f $line+'zip'; then
    printf "%s backup dont exists.Creating....\n" : $line
  fi
done < "$input"

