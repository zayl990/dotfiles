# from oh-my-zsh

# problem with git
setopt NO_NOMATCH

function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}$(parse_git_dirty)"
}

# Checks if working tree is dirty
parse_git_dirty() {
  local SUBMODULE_SYNTAX=''
  local GIT_STATUS=''
  local CLEAN_MESSAGE='nothing to commit (working directory clean)'
  if [[ "$(command git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      SUBMODULE_SYNTAX="--ignore-submodules=dirty"
    fi

    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} -uno 2> /dev/null | tail -n1)
    else
      GIT_STATUS=$(command git status -s ${SUBMODULE_SYNTAX} 2> /dev/null | tail -n1)
    fi

    if [[ -n $GIT_STATUS ]]; then
      # dirty
      echo "%{$fg[red]%} *%{$reset_color%}"
    else
      # clean
      echo ""
    fi
  else
    # clean
    echo ""
  fi
}

# git aliases
alias g='git'
compdef g=git

alias gs='git status -s'
compdef _git gs=git-status

alias gl='git pull'
compdef _git gl=git-pull

alias gp='git push'
compdef _git gp=git-push

alias gco='git checkout'
compdef _git gco=git-checkout

alias ga='git add -A && gs'

alias glo='git log'
compdef _git glo=git-log

gc() { git commit -v -m "$*" }
alias gca='git commit --amend'
