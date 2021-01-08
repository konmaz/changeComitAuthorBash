#!/bin/bash

# while true; do
#    read -p "This script uses the very powerful command 'git commit -f'. It can mess your GitHub repositories. Do you understand the consequences and want to continue? (yes\no): " yn
#    case $yn in
#        [Yy]* )break;;
#        [Nn]* ) exit;;
#        * ) echo "Please answer yes or no.";;
#   esac
# done

echo "STARING";

# Read config.txt
arr=() # Create array
while IFS= read -r line || [[ "$line" ]]; do
  arr+=("$line")
done < 'config.txt' 

echo ${arr[0]}
echo ${arr[1]}
echo ${arr[2]}
printf "OLD_EMAIL=%s\n"${arr[0]}
printf "CORRECT_NAME=%s\n"${arr[1]}
printf "CORRECT_EMAIL=%s"\n\n\n${arr[2]}

mkdir -p tempRepos; # Create directory if does not exist
cd tempRepos; # Go inside the directory tempRepos
mkdir -p backups; # Create directory if does not exist

while read line || [[ -n $line ]]; do # Read every line in repos.txt
  printf "\n\n\n-----------------------------\nFor repo : %s:\n" : $line  
  NAME=${line##*/} # The repository name
  if test -f $NAME; then
    printf "Repository already exist in tempRepos\n"
    #break;
  fi
  git clone git@github.com:$line
  zip -qq -r ./backups/$NAME $NAME
  cd $NAME
  printf "---\n"
  printf "Repository Authors are : \n";
  
  git log --format='%aN - %ae %n' | sort -u
  
  git filter-branch --env-filter '
  OLD_EMAIL=${arr[0]}
  CORRECT_NAME=${arr[1]}
  CORRECT_EMAIL=${arr[2]}
  if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
  then
      export GIT_COMMITTER_NAME="$CORRECT_NAME"
      export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
  fi
  if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
  then
      export GIT_AUTHOR_NAME="$CORRECT_NAME"
      export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
  fi
  ' --tag-name-filter cat -- --branches --tags
  printf "---\n"
  printf "\Repository Authors AFTER CHANGE are : \n";
  git log --format='%aN - %ae %n' | sort -u
  
  git push -f
  cd .. # go back 
  #echo $var
    
done < '../repos.txt'

