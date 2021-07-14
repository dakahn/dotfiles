#####################################################
# Setup 
#####################################################
TERM=screen-256color
plugins=(git taskwarrior zsh-autosuggestions)

source ~/.oh-my-zsh/oh-my-zsh.sh
DISABLE_AUTO_TITLE="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/dak/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

#####################################################
# System aliases 
#####################################################
alias code='cd ~/Code'
alias carb='cd ~/Code/carbon'
alias note='cd ~/Notes'
alias nn='cd ~/Notes && nvim .'
alias carbstart='cd ~/Code/carbon/packages/react && yarn start'
alias carbsite='cd ~/Code/carbon-website'
alias v='nvim'
alias vcfg='nvim ~/.config/nvim/init.vim'
alias zcfg='nvim ~/.zshrc'
alias szcfg='source ~/.zshrc'
update_config() {
  config add ~/.config/nvim/init.vim 
  && config add ~/.config/nvim/lua/init.lua 
  && config add ~/.config/nvim/statusline.vim
  && config add ~/.taskrc ~/.zshrc 
  && config commit
  && config push origin master
}
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cua=update_config()
alias master='main'
alias f='fzf'
alias la='ls -A -1'
alias cg='cd `git rev-parse --show-toplevel`'
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
