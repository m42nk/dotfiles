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
  # TODO: this command is so slow, consider switching from asdf?
  source $ASDF_DIR/plugins/golang/set-env.zsh

  # TODO: need to use hooks so that go versions updates
  # as directory changes, see set-env.zsh script above
  # export GOPATH="$(asdf where golang)/packages"
  export GOPATH="$GOROOT/packages"
  export PATH="$GOPATH/bin:$PATH"
fi

function asdf-golang-env(){
  go_dir=$(asdf where golang)
  export GOPATH="$go_dir/packages"
  export PATH="$go_dir/packages/bin:$PATH"
}
