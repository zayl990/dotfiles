# rails
alias fsd='bundle exec foreman s -f Procfile.dev'
alias rdm='bundle exec rake db:migrate'

# capistrano
alias cpd='bundle exec cap production deploy'
alias csd='bundle exec cap staging deploy'
alias cpsd='bundle exec cap production sync:pull_db'
