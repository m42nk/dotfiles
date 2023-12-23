if ! command -v asdf >/dev/null; then
  return
fi

# TODO: Do when installing asdf with brew,
# scripts bellow is not tested
# if command -v brew >/dev/null; then
#   brew_prefix=$(brew --prefix asdf)
#   if [[ -f "$brew_prefix/libexec/asdf.sh" ]]; then
#     source "$brew_prefix/libexec/asdf.sh"
#   fi
# fi

# [[ -d $HOME/.asdf/plugins/golang ]] && source $HOME/.asdf/plugins/golang/set-env.zsh
if ! [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  return
fi

source "$HOME/.asdf/asdf.sh"
fpath=($ASDF_DIR/completions $fpath)

if [[ -d "$ASDF_DIR/plugins/golang" ]]; then
  # TODO: this command is so slow, consider switching from asdf?
  source $ASDF_DIR/plugins/golang/set-env.zsh

  # TODO: need to use hooks so that go versions updates
  # as directory changes, see set-env.zsh script above
  # export GOPATH="$(asdf where golang)/packages"
fi

