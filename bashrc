cd $HOME

eval "$(dircolors -b)"

alias ls="ls --color=auto"
alias l="ls -a"
alias la="ls -lah"
alias ll="ls -lh"

alias grep="grep --color=auto"

alias burpsuite='java -jar /usr/bin/burpsuite'

PS1='\[\e[1;31m\]\u@kali\[\e[00m\]:\[\e[1;34m\]\w\[\e[00m\]\$ '
