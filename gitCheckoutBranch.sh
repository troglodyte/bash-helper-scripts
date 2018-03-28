#!/bin/bash
printf "Stashing current changes if any\n"
git stash
git fetch --all
tag=${1?Needs ticket number}
cur=`git branch --all | grep -m 1 $tag | sed "s/\*//g"`
cur=`echo $cur | sed "s/remotes\///g" | sed "s/origin\///g"`
printf "\n\n***********************\n"
printf "Searching for #$tag -> $cur\n"
printf "        ¯\_(ツ)_/¯\n"
printf "***********************\n\n"
git checkout $cur
git pull origin $cur
