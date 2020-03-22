alias ls='ls --color'
alias ps='ps -o pid,ppid,user,group,stime,etime,time,state=STATUS,addr,args -x -ww'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=99999
setopt appendhistory autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/larntz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload promptinit
promptinit
#prompt walters
prompt adam1
