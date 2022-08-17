export ASDF_KERL_VERSION="2.2.4"

if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  source $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
elif [[ $(command -v brew) ]] && [[ $(command -v asdf) ]]; then
  source $(brew --prefix)/opt/asdf/libexec/asdf.sh
fi
