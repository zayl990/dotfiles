# homebrew
export PATH=/usr/local/bin:$PATH

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# pip
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# postgres
export PGHOST=localhost

# functions
for function in ~/.zsh/functions/*; do
  source $function
done

# completion
autoload -U compinit && compinit

# expand functions in the prompt
setopt prompt_subst

# colors
autoload -U colors && colors

# prompt
export PS1='[%{$fg[green]%}${SSH_CONNECTION+"%n@%m:"}%~%{$reset_color%}] '
export RPS1='%{$fg[yellow]%}$(git_prompt_info)%{$reset_color%}'

# ignore duplicate history entries
setopt histignoredups

# try to correct command line spelling
# setopt CORRECT CORRECT_ALL

# history
export HISTSIZE=2000

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
