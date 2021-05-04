#####################################################
# System aliases 
#####################################################
alias python="python3"
alias proj='cd ~/projects'
alias carb='cd ~/projects/carbon'
alias recarb='cd ~/projects/carbon/packages/react'
alias carbsite='cd ~/projects/carbon-website'
alias v='nvim'
alias vcfg='nvim ~/.config/nvim/init.vim'
alias zcfg='nvim ~/.zshrc'
alias szcfg='source ~/.zshrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias python='python2'
alias master='main'

#####################################################
# Tmux aliases 
#####################################################
alias tkill='tmux kill-session -t'
alias tkillall='tmux kill-session -a'
alias tlast='tmux attach-session'
alias tls='tmux ls'
alias tnew='tmux new -s'


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
export ZSH="/home/dakahn/.oh-my-zsh"

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

TERM=screen-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
