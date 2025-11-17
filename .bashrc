###########################
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


###########################
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export VISUAL=vim
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git ."


##############
# Autocomplete
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"


####################
# Improve navigation
shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null


#####################
# Functions, commands
eval "$(fzf --bash)"


#########
# Aliases
alias v='vim'
alias sv='sudoedit'
alias vf='vim $(fzf)'
alias svf='sudoedit $(fzf)'
alias dakpi='ssh 192.168.1.69'
alias bashcfg='vim ~/.bashrc'
alias bashsrc='source ~/.bashrc'
alias vcfg='vim ~/.vimrc'
alias config='/usr/bin/git --git-dir=/home/dakahn/.cfg/ --work-tree=/home/dakahn'
alias ggconfig='config push origin master'

