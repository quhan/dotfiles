# For Homebrew. Refer to http://rkulla.blogspot.sg/2014/03/the-path-to-homebrew.html
export PATH=/usr/local/bin:$PATH

# Set timezone so file creation/modification dates make sense
TZ="Asia/Singapore"

alias vi=vim # Always use vim
alias ls="ls -G" # ls with color
alias lh='ls -a | egrep "^\."' # ls hidden dot files
alias flush="sudo discoveryutil udnsflushcaches" # Flush DNS (Yosemite)
alias xcode="open *.xcodeproj" # Shortcut to open an Xcode Project

export MAGENTA="\033[1;31m"
export ORANGE="\033[1;33m"
export GREEN="\033[1;32m"
export PURPLE="\033[1;35m"
export WHITE="\033[1;37m"
export BOLD=""
export RESET="\033[m"

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# To launch Visual Studio Code
code () {
	if [[ $# = 0 ]]
	then
		open -a "Visual Studio Code"
	else
		[[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
		open -a "Visual Studio Code" --args "$F"
	fi
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"
