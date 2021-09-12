# learn_linux
function learn(){
    # if arg=linux open linux
    if [[ $1 == "linux" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/linux_bash/learn_linux.txt
    elif [[ $1 == "bash" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/linux_bash/learn_bash.txt
    elif [[ $1 == "git" ]]; then
	emacs -nw /home/zaeem/git/learn-github/git_commands.txt
    elif [[ $1 == "emacs" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/emacs/learn_emacs/basics.el
    elif [[ $1 == "gdb" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/gdb/learn_gdb.txt    	
    elif [[ $1 == "valgrind" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/valgrind/learn_valgrind.txt
    elif [[ $1 == "c" ]]; then
	emacs -nw /home/zaeem/git/zaeem/learning/c/learn_c.txt	
    elif [[ $1 == "create" ]]; then
	# check if file does not already exists
	if [[ ! -f $2 ]]; then
	    touch $2
	    echo "please update .bashrc"
	else
	    echo "file is already there"
	fi
    elif [[ $1 == "-h" ]]; then
	# print help
	echo "learn linux"
	echo "learn bash"
	echo "learn git"
	echo "learn emacs"
	echo "learn create path/file"
	echo "learn gdb"
	echo "valgrind"
	echo "c"
    fi
}

learn $*
