alias be='bundle exec'
alias bl='bundle list'
alias bo='bundle open'
alias bu='bundle update'
alias bi='bundle install'

bundled_commands=(
  annotate
  cap
  capify
  cucumber
  mina
  foodcritic
  guard
  irb
  jekyll
  kitchen
  knife
  middleman
  nanoc
  pry
  puma
  rackup
  rainbows
  rake
  rspec
  shotgun
  sidekiq
  spec
  spork
  spring
  strainer
  tailor
  taps
  thin
  thor
  unicorn
  unicorn_rails
)

_binstubbed() {
  [ -f "./bin/${1}" ]
}

_run-with-bundler() {
  if _binstubbed $1; then
    ./bin/$@
  else
    bundle exec $@
  fi
}

for cmd in $bundled_commands; do
  eval "function unbundled_$cmd () { $cmd \$@ }"
  eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"
  alias $cmd=bundled_$cmd

  if which _$cmd > /dev/null 2>&1; then
    compdef _$cmd bundled_$cmd=$cmd
  fi
done