#####################################################
# System aliases 
#####################################################
alias python="python3"
alias code='cd ~/Code'
alias carb='cd ~/Code/carbon'
alias recarb='cd ~/Code/carbon/packages/react'
alias carbsite='cd ~/Code/carbon-website'
alias v='nvim'
alias vcfg='nvim ~/.config/nvim/init.vim'
alias zcfg='nvim ~/.zshrc'
alias szcfg='source ~/.zshrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cua='config add ~/.config/nvim/init.vim ~/.taskrc ~/.zshrc && config commit && config push origin master'
alias master='main'
alias f='fzf'
alias la='ls -A -1'
alias cg='cd `git rev-parse --show-toplevel`'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ....='cd .. && cd .. && cd ..'
alias gd='git diff'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gpum'git pull upstream main'
alias gpoh'git push origin HEAD'

#####################################################
# Tmux aliases 
#####################################################
alias tn="tmux -u new"
alias ta="tmux -u attach"


#####################################################
# Carbon aliases 
#####################################################
alias runtests='yarn test --changedSince=master'
# Raises the limit to 10000 open files for the current session and reloads the shell
alias prebuild='sudo prlimit -p "$$" --nofile=10000:10000 && exec zsh'
alias bigdev='NODE_OPTIONS=--max_old_space_size=8192 yarn dev'

#####################################################
# Clipboard config 
#####################################################
yanktoclipboard(){
      echo $BUFFER | xsel -i -b
      
}
pastefromclipboard(){
      RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
      
}
zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard

#####################################################
# Setup 
#####################################################
TERM=screen-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/dak/.zfunctions")

autoload -U promptinit; promptinit
prompt spaceship


