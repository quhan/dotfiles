# For Homebrew. Refer to http://rkulla.blogspot.sg/2014/03/the-path-to-homebrew.html
export PATH=/usr/local/bin:$PATH

# Set timezone so file creation/modification dates make sense
TZ="Asia/Singapore"

# always use vim
alias vi=vim

# ls with color
alias ls="ls -G"

# ls hidden dot files
alias lh='ls -a | egrep "^\."'

function parse_git_dirty() {
		[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch() {
		git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export MAGENTA="\033[1;31m"
export ORANGE="\033[1;33m"
export GREEN="\033[1;32m"
export PURPLE="\033[1;35m"
export WHITE="\033[1;37m"
export BOLD=""
export RESET="\033[m"

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"
