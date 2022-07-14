#!/bin/bash
function learn(){
    if [[ $1 == "learn" ]]; then
        if [[ -f /home/zaeem/git/zaeem/learning/$2/learn_$2.txt ]]; then            
            emacs -nw /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        fi
        
    elif [[ $1 == "create" ]]; then        
        mkdir /home/zaeem/git/zaeem/learning/$2
        touch /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        emacs -nw /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        
    elif [[ $1 == "delete" ]]; then
        sudo rm -ir /home/zaeem/git/zaeem/learning/$2
    elif [[ $1 == "help" ]]; then
        echo "=======Available commands=========="
        for dir in $(ls /home/zaeem/git/zaeem/learning); do
            echo "learn [cd] $dir"
        done
        echo "======================="
        echo "to create new notes 'learn -c notesname'"
        echo "to delete notes 'learn -d notesname'"
        echo "to edit notes 'learn notesname'"
    else
        echo "$1 is nto handled yet"
    fi
}

if [[ $# -gt 0 ]]; then
    while getopts ":c:d:e" o; do
        case "${o}" in
            c)
                # create a newnotes
                dir=${OPTARG}
                learn create $dir
                ;;
            d)
                dir=${OPTARG}
                learn delete $dir
                ;;
            e)
                emacs -nw /home/zaeem/git/zaeem/learning/learn
                ;;
            *)
                learn help
                ;;
        esac    
    done
    shift $((OPTIND-1))
    if [[ $# -gt 0 ]]; then
        learn learn $@
    fi    
else
    learn help
fi
