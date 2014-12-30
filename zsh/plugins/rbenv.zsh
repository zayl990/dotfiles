alias rubies='rbenv versions'

function current_ruby() {
  echo "$(rbenv version-name)"
}

function gems {
  local rbenv_path=$(rbenv prefix)
  gem list $@ | sed -E \
    -e "s/\([0-9a-z, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
    -e "s|$(echo $rbenv_path)|$fg[magenta]\$rbenv_path$reset_color|g" \
    -e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
    -e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
}

# function rbenv_prompt_info() {
#   echo "$(current_ruby)"
# }
