#!/bin/bash
function learn(){
    if [[ $1 == "learn" ]]; then
        if [[ -f /home/zaeem/git/zaeem/learning/$2/learn_$2.txt ]]; then            
            emacsclient -c /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        else
            echo "no such notes"
            echo "type 'learn -c $2' to create new notes"
        fi
    elif [[ $1 == "view" ]]; then
        if [[ -f /home/zaeem/git/zaeem/learning/$2/learn_$2.txt ]]; then            
            cat /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        else
            echo "no such notes"
            echo "type 'learn -c $2' to create new notes"
        fi        
        
    elif [[ $1 == "create" ]]; then        
        mkdir /home/zaeem/git/zaeem/learning/$2
        touch /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
        emacsclient -c /home/zaeem/git/zaeem/learning/$2/learn_$2.txt
    elif [[ $1 == "update" ]]; then
        # it will create a softlink
        # copy softlink to /usr/bin/
        rm -rf /home/zaeem/git/zaeem/learning/learn
        ln -s /home/zaeem/git/zaeem/learning/learn.sh /home/zaeem/git/zaeem/learning/learn
        sudo mv -f /home/zaeem/git/zaeem/learning/learn /usr/bin//learn
        
    elif [[ $1 == "delete" ]]; then
        sudo rm -ir /home/zaeem/git/zaeem/learning/$2
    elif [[ $1 == "help" ]]; then
        echo "=======Available commands=========="
        for dir in $(ls /home/zaeem/git/zaeem/learning); do
            echo "learn [cd] $dir"
        done
        echo "======================="
        echo "-e: to edit learn.sh' and update it"
        echo "-c: to create new notes 'learn -c notesname'"
        echo "-d: to delete notes 'learn -d notesname'"
        echo "to edit 'learn notesname'"        
        echo "-u: to update and copy to /usr/bin/"
    else
        echo "$1 is nto handled yet"
    fi
}

if [[ $# -gt 0 ]]; then
    while getopts ":c:d:euv:" o; do
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
                emacsclient -c /home/zaeem/git/zaeem/learning/learn.sh
                learn update
                ;;
            u)
                learn update
                # copy softlink to /usr/bin
                ;;
            v)
                dir=${OPTARG}
                learn view $dir
                # copy softlink to /usr/bin
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
