#!/bin/bash
function gco {
    printf "\n---------------------------------------------"
    printf "\n------------ Checking out branch ------------"
    printf "\n---------------------------------------------\n\n"

    tag=${1?Needs ticket number}
    git fetch --all
    cur=`git branch --all | grep -m 1 $tag | sed "s/\*//g"`
    cur=`echo $cur | sed "s/remotes\///g" | sed "s/origin\///g"`

    printf "\n\n --------------------------------\n"
    printf "Looking for #$tag -> $cur\n"
    printf "        ¯\_(ツ)_/¯\n"
    printf " ------------------------------------\n\n"

    printf "Stashing current changes if any\n"
    git stash

    git checkout $cur
    git pull origin $cur

    printf "\n------------ Done Checking out branch ------------\n\n"
}