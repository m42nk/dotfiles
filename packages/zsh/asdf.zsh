# TODO: Do when installing asdf with brew,
# scripts below is not tested
# if command -v brew >/dev/null; then
#   brew_prefix=$(brew --prefix asdf)
#   if [[ -f "$brew_prefix/libexec/asdf.sh" ]]; then
#     source "$brew_prefix/libexec/asdf.sh"
#   fi
# fi

if ! [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  return
fi

source "$HOME/.asdf/asdf.sh"
fpath+=($ASDF_DIR/completions)

if [[ -d "$ASDF_DIR/plugins/golang" ]]; then
  # function asdf_update_golang_env_additional(){
  #   local go_path="$(asdf where golang)"
  #   local go_dir="$(dirname "${go_path}")"
  #
  #   # export GOROOT="$go_path/go"
  #   export GOPATH="$go_path/packages"
  #
  #   local bin="$go_path/packages/bin"
  #
  #   # only add if not already in PATH
  #   [[ ":$PATH:" != *":$bin:"* ]] && export PATH="$bin:$PATH"
  #
  #   # remove other version (in go_dir) from path
  #   for dir in $go_dir/*; do
  #     [[ "$dir" == "$go_path" ]] && continue
  #
  #     other_bin="$dir/packages/bin"
  #     export PATH="${PATH//$other_bin:/}"
  #   done
  # }
  #
  # autoload -U add-zsh-hook
  # add-zsh-hook precmd asdf_update_golang_env_additional

  zsh ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
fi
