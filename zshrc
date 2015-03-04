# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# rvm
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# chef-dk
export PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH

# heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# pip
# export PIP_REQUIRE_VIRTUALENV=true
# export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# virtualenvwrapper
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# postgres
export PGHOST=localhost

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
setopt APPEND_HISTORY
export HISTSIZE=2000

# plugins
for function in ~/.zsh/plugins/*; do
  source $function
done

# aliases
# [[ -f ~/.aliases ]] && source ~/.aliases
