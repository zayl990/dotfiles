fpath=($rvm_path/scripts/zsh/Completion $fpath)

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'

# local ruby20='ruby-2.0.0'

# function rb {
#   if [ -z "$1" ]; then
#     rvm use "$ruby20"
#   else
#     rvm use "$ruby20@$1"
#   fi
# }

# _rb() {compadd `ls -1 $rvm_path/gems | grep "^$ruby20@" | sed -e "s/^$ruby20@//" | awk '{print $1}'`}
# compdef _rb rb

function _rvm_completion {
  source $rvm_path"/scripts/zsh/Completion/_rvm"
}
compdef _rvm_completion rvm