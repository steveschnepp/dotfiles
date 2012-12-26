alias p='pwd && pwd -LP'
alias c='clear'
alias q='quota -v -s'
alias qq='ssh cspro quota -v -s'
alias reload='. ~/.bashrc'
alias real='cd "`pwd -LP`"'
alias tempty='trash-empty'
alias tlist='trash-list'
alias tsave='restore-trash'
alias rrm='/bin/rm'
alias g='pwd > ~/.go_last && echo "RECORDED GO LOCATION!"'
alias go='cd `cat ~/.go_last` && echo "GOTO GO LOCATION!"'

killbitch() {
	awk '{print $2}' | xargs kill
}

mm() {
	for x in "$@"; do
		make -C $x
	done
}

ee() { # echo and execute
    echo "$@"
    $1 "$2"
}

jaehyun() {
	if [ "$1" == "0" ]; then
		ssh -i ~/.ssh/J43HYUN2M1nH0 cs20081610@cspro
	else
		if [ "$1" == "1" ]; then
			ssh -i ~/.ssh/J43HYUN2M1nH0 cs20081610@cspro1
		else
			ssh -i ~/.ssh/J43HYUN2M1nH0 cs20081610@cspro2
		fi
	fi
}
	

extract () { # extract files. Ignore files with improper extensions.
    local x
    for x in "$@"; do
        [[ -f $x ]] || continue
        case "$x" in
                *.tar.bz2 | *.tbz2 )    ee "tar xvjf" "$x"      ;;
                *.tar.gz | *.tgz ) ee "tar xvzf" "$x"   ;;
                *.bz2 )                         ee "bunzip2" "$x"       ;;
                *.rar )                         ee "unrar x" "$x"   ;;
                *.gz )                          ee "gunzip" "$x"    ;;
                *.tar )                         ee "tar xvf" "$x"   ;;
                *.zip )                         ee "unzip" "$x"     ;;
                *.Z )                           ee "uncompress" "$x" ;;
                *.7z )                          ee "7z x" "$x"      ;;
                *.deb )                         ee "ar vx" "$x"     ;;
        esac
    done
}

alias rm='trash-put'
alias howmuch='du -h --max-depth=1'

function rand() {
    if [ "$2" == "0" ]; then
        cat /dev/urandom | tr -cd '[:alnum:]' | head -c ${1:-32}
    else
        cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-32}
    fi
    echo
}

alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk -h | sort -rn'
alias vi='vim'

mkcd() {
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

checkcpuforpath () {
	cpuinfo=`cat /proc/cpuinfo | grep "cpu family" | grep 15`
	if [ -d ~/.local/bin ]; then
		export PATH=~/.local/bin:$PATH
	fi
	if [ -d ~/.local/lib/python2.6/site-packages ]; then
		export PYTHONPATH=/usr/lib/python2.6/:~/.local/lib/python2.6/site-packages:$PYTHONPATH
	fi
	if [ -n "$cpuinfo" ]; then
		echo "Connected with cspro(1:2).sogang.ac.kr"
		if [ -d ~/.local/bin_32 ]; then
			export PATH=~/.local/bin_32:$PATH
		fi
		export PKG_CONFIG_PATH=~/.local/lib_32/pkgconfig:/usr/lib/pkgconfig
		export LD_LIBRARY_PATH=/usr/lib/
		export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib_32
		if [ -d ~/.local/lib_32/python2.6/site-packages ]; then
			export PYTHONPATH=~/.local/lib_32/python2.6/site-packages:$PYTHONPATH
		fi
	else
		echo "Connected with cspro.sogang.ac.kr"
		if [ -d ~/.local/bin_64 ]; then
			export PATH=~/.local/bin_64:$PATH
		fi
		export PKG_CONFIG_PATH=~/.local/lib_64/pkgconfig:/usr/lib/pkgconfig
		export LD_LIBRARY_PATH=/usr/lib/
		export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib_64
		if [ -d ~/.local/lib_64/python2.6/site-packages ]; then
			export PYTHONPATH=~/.local/lib_64/python2.6/site-packages:$PYTHONPATH
		fi
	fi
	export PATH=~/bin:$PATH
}

ffind() { find . -type f -exec grep -nHr --color "$1" {} \; ; }
